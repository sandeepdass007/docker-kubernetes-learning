#!/usr/bin/env bash
set -e

echo "🐳 Installing Docker..."

OS="$(uname -s)"

if command -v docker >/dev/null 2>&1; then
  echo "✅ Docker is already installed"
  docker --version
  exit 0
fi

case "$OS" in
  Darwin)
    echo "📦 macOS detected"
    echo "👉 Please install Docker Desktop manually:"
    echo "   https://www.docker.com/products/docker-desktop/"
    echo ""
    echo "After installation:"
    echo "1. Start Docker Desktop"
    echo "2. Re-run ./bootstrap.sh"
    exit 1
    ;;
  Linux)
    echo "📦 Linux detected"
    echo "Installing Docker using official convenience script..."

    curl -fsSL https://get.docker.com | sh

    sudo usermod -aG docker "$USER"

    echo "⚠️ Docker installed, but you must log out and log back in"
    echo "   for docker group permissions to take effect."
    ;;
  *)
    echo "❌ Unsupported OS for Docker installation"
    exit 1
    ;;
esac

echo "✅ Docker installation step completed"
