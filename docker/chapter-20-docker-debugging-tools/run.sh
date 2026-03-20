#!/bin/bash

echo "Building debug image..."

docker build -t debug-container ./debug-container

echo "Running container..."

docker run -d --name debug-demo debug-container

echo ""
echo "Container started:"
docker ps