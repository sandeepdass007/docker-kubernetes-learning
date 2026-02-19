#!/bin/bash
set -e

IMAGE_NAME=chapter06-shared-network
NETWORK_NAME=shared-net

echo "Creating shared network..."
docker network create $NETWORK_NAME >/dev/null 2>&1 || true

echo "Building image..."
docker build -t $IMAGE_NAME .

echo
echo "Starting SERVER in shared network..."
docker run -d \
  --name shared-server \
  --network $NETWORK_NAME \
  --network-alias server \
  -e ROLE=server \
  $IMAGE_NAME

echo
echo "Starting CLIENT in shared network..."
docker run --rm \
  --name shared-client \
  --network $NETWORK_NAME \
  -e ROLE=client \
  -e SERVER_HOST=server \
  $IMAGE_NAME