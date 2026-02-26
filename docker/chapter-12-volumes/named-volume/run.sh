#!/bin/bash

set -e

IMAGE_NAME=chapter12-named-volume
CONTAINER_NAME=named-volume-server
VOLUME_NAME=chapter12-data

echo "Building image..."
docker build -t $IMAGE_NAME .

echo "Creating named volume (if not exists)..."
docker volume create $VOLUME_NAME >/dev/null

echo "Running container with named volume..."
docker run -d \
  --name $CONTAINER_NAME \
  -p 5001:5001 \
  -v $VOLUME_NAME:/data \
  $IMAGE_NAME

echo "Server is running at http://localhost:5001"