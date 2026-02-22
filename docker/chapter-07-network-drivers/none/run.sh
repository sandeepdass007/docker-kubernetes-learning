#!/bin/bash
set -e

IMAGE_NAME=chapter07-none-network

echo "Building image..."
docker build -t $IMAGE_NAME .

echo ""
echo "Running container with --network none"
echo "This container will have ZERO network access"
echo ""

docker run --rm \
  --network none \
  $IMAGE_NAME