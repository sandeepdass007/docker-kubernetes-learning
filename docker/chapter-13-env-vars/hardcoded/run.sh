#!/bin/bash

echo "Building image..."

docker build -t env-hardcoded-app .

echo "Running container..."

docker run --rm \
  -p 5001:5001 \
  --name env-hardcoded-container \
  env-hardcoded-app