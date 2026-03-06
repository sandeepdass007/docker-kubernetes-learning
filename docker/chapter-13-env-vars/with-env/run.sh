#!/bin/bash

echo "Building Docker image..."

docker build -t env-app .

echo "Running container with environment variables..."

docker run --rm \
-p 5001:5001 \
-e ENVIRONMENT=production \
-e APP_MESSAGE="Hello from Docker Environment Variables!" \
env-app