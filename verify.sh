#!/usr/bin/env bash
set -e

echo "🔍 Running system verification..."

OS="$(uname -s)"

case "$OS" in
  Darwin)
    PLATFORM="macOS"
    ;;
  Linux)
    PLATFORM="Linux"
    ;;
  *)
    echo "❌ Unsupported OS: $OS"
    echo "This repository supports macOS and Linux only."
    exit 1
    ;;
esac

echo "✅ OS detected: $PLATFORM"

# Check required commands
REQUIRED_COMMANDS=("curl" "git")

for cmd in "${REQUIRED_COMMANDS[@]}"; do
  if ! command -v "$cmd" >/dev/null 2>&1; then
    echo "❌ Missing required command: $cmd"
    echo "Please install '$cmd' and re-run ./bootstrap.sh"
    exit 1
  fi
  echo "✅ Found: $cmd"
done

echo "🎉 System verification passed!"