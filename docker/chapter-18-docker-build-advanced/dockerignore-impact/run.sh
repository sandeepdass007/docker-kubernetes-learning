#!/bin/bash

./large-file-generator.sh

echo ""
echo "Building Docker image..."

docker build -t dockerignore-impact .

echo ""
echo "Starting container..."

docker run -d \
  --name dockerignore-impact \
  dockerignore-impact

sleep 5

docker ps