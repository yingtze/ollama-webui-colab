#!/bin/bash
set -e
# Untuk menampilkan log
log() {
  echo "[$(date '+%Y-%m-%d %H:%M:%S')] $*"
}

# 1. Install lshw pada Debian
log "Memperbarui daftar paket..."
apt-get update

log "Menginstall lshw..."
apt-get install -y lshw

# 2. Install ollama service
log "Menginstall ollama service..."
curl -fsSL https://ollama.com/install.sh | sh

# 3. Install uvx
log "Menginstall uvx..."
curl -LsSf https://astral.sh/uv/install.sh | sh

# Source environment uvx jika tersedia
if [ -f "$HOME/.local/bin/env" ]; then
  log "Melakukan source uvx env..."
  source "$HOME/.local/bin/env"
else
  log "Env uvx tidak ditemukan di \$HOME/.local/bin/env"
fi

# 4. Install cloudflared
CLOUDFLARED_DEB="cloudflared-linux-amd64.deb"
log "Mengunduh cloudflared..."
curl -L "https://github.com/cloudflare/cloudflared/releases/latest/download/cloudflared-linux-amd64.deb" -o "${CLOUDFLARED_DEB}"

log "Menginstall cloudflared..."
dpkg -i "${CLOUDFLARED_DEB}" || apt-get install -f -y

log "Membersihkan file installer cloudflared..."
rm -f "${CLOUDFLARED_DEB}"

# 5. Install open-webui
log "Menginstall open-webui..."
DATA_DIR=$PWD/open-webui uvx --python 3.11 open-webui@latest

log "Instalasi selesai!"
