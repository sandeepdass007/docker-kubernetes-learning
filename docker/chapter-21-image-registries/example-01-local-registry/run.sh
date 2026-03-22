#!/bin/bash

set -e

echo "Starting local registry..."
docker run -d -p 5001:5000 --name local-registry registry:2 || true

echo "Building image..."
docker build -t my-app .

echo "Tagging image for registry..."
docker tag my-app localhost:5001/my-app:v1

echo "Pushing to registry..."
docker push localhost:5001/my-app:v1

echo "Removing local image to simulate fresh environment..."
docker rmi localhost:5001/my-app:v1

echo "Pulling image from registry..."
docker pull localhost:5001/my-app:v1

echo "Running container from registry image..."
docker run -d \
  --name local-registry-demo \
  -p 5002:5002 \
  localhost:5001/my-app:v1

sleep 5

docker ps

echo "Streaming logs..."
docker logs -f local-registry-demo