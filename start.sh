#!/bin/bash
set -e

# 1. Jalankan ollama serve di background terlebih dahulu
echo "Menjalankan ollama serve di background..."
ollama serve > /dev/null 2>&1 &

# 2. Jalankan open-webui dengan uvx di background
echo "Menjalankan open-webui di background..."
DATA_DIR=$PWD/open-webui uvx --python 3.11 open-webui@latest serve --port 8090 > /dev/null 2>&1 &

echo "Tunggu..."
sleep 20

# 3. Jalankan Cloudflared Tunnel
echo "Menjalankan cloudflared tunnel..."
cloudflared tunnel --url http://localhost:8090
