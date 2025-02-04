#!/bin/bash
set -e

echo "Menjalankan open-webui di background..."
DATA_DIR=$PWD/open-webui uvx --python 3.11 open-webui@latest serve --port 8090 > /dev/null 2>&1 &

echo "Tunggu..."
sleep 20

echo "Menjalankan cloudflared tunnel..."
cloudflared tunnel --url http://localhost:8090
