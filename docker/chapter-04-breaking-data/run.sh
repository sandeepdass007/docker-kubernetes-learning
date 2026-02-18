#!/bin/bash
set -e

IMAGE_NAME=chapter04-volumes
CONTAINER_NAME=chapter04-container
VOLUME_NAME=chapter04-data

echo "Creating volume if it doesn't exist..."
docker volume create $VOLUME_NAME >/dev/null

echo "Building image..."
docker build -t $IMAGE_NAME .

echo "Running container with volume mounted..."
docker run --name $CONTAINER_NAME \
  -v $VOLUME_NAME:/app/data \
  $IMAGE_NAME

echo
echo "Container finished."
