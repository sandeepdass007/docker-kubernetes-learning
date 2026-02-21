#!/bin/bash
set -e

IMAGE_NAME=chapter07-host-network

echo "Building image..."
docker build -t $IMAGE_NAME .

echo ""
echo "Running container with --network host"
echo "No port mapping (-p) is used or allowed"
echo "This container will share the HOST network stack"
echo ""

docker run --rm \
  --network host \
  $IMAGE_NAME