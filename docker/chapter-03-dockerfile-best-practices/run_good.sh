#!/bin/bash
set -e

IMAGE_NAME="chapter03-good"
CONTAINER_NAME="chapter03-good-container"

echo "Building GOOD Docker image..."
docker build -f Dockerfile.good -t $IMAGE_NAME .

echo "Running container from GOOD image..."
docker run --name $CONTAINER_NAME $IMAGE_NAME

echo "Container execution completed successfully."
