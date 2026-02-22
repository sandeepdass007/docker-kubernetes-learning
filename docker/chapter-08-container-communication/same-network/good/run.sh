#!/bin/bash
set -e

NETWORK_NAME=chapter08-net
IMAGE_NAME=chapter08-same-network

echo "Creating shared network..."
docker network create $NETWORK_NAME 2>/dev/null || true

echo "Building image..."
docker build -t $IMAGE_NAME .

echo "Starting SERVER container..."
docker run -d \
  --name same-server \
  --network-alias server \
  --network $NETWORK_NAME \
  $IMAGE_NAME \
  python app.py server

echo "Starting CLIENT container..."
docker run --rm \
  --name same-client \
  --network $NETWORK_NAME \
  $IMAGE_NAME \
  python app.py client