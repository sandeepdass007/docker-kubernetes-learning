#!/usr/bin/env bash
set -e

IMAGE_NAME="docker-layer-demo"

echo "🧹 Removing Docker image: $IMAGE_NAME"
docker rmi -f $IMAGE_NAME || true

echo "✅ Cleanup completed"
