#!/bin/bash

echo ""
echo "=============================="
echo "Creating buildx builder"
echo "=============================="

docker buildx create --use --name multiarch-builder 2>/dev/null || true

echo ""
echo "=============================="
echo "Building multi-arch image"
echo "=============================="

docker buildx build \
  --platform linux/amd64,linux/arm64 \
  -t multiarch-demo \
  --load \
  .

echo ""
echo "Running container..."

docker run --rm multiarch-demo