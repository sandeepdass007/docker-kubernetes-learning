#!/usr/bin/env bash
set -e

IMAGE_NAME="docker-layer-demo"

echo "🐳 Docker Image Layers Demo — Chapter 2"
echo ""

echo "📦 Building Docker image..."
docker build -t $IMAGE_NAME .

echo ""
echo "🚀 Running container to display file content:"
docker run --rm $IMAGE_NAME

echo ""
echo "✅ Run completed"
