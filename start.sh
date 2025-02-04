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

# # 3. Jalankan Cloudflared Tunnel
# echo "Menjalankan cloudflared tunnel..."
# cloudflared tunnel --url http://localhost:8090

# 3. Download dan ekstrak Bore
echo "Mengunduh dan mengekstrak Bore..."
wget -qO- "https://github.com/ekzhang/bore/releases/download/v0.5.2/bore-v0.5.2-x86_64-unknown-linux-musl.tar.gz" | tar -xz

# 4. Jalankan Bore
echo "Menjalankan bore tunnel..."
./bore local 8090 --to bore.pub | while read line; do
    if echo "$line" | grep -q 'bore.pub'; then
        port=$(echo "$line" | grep -o 'bore.pub:[0-9]*')
        echo "Ini situsnya, silahkan di klik http://$port"
        echo "Tolong tunggu agak lama ya"
    fi
done