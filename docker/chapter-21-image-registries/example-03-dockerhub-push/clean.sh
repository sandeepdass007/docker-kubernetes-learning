#!/bin/bash

echo "Cleaning up..."

docker stop dockerhub-demo-container 2>/dev/null || true
docker rm dockerhub-demo-container 2>/dev/null || true

docker rmi sandeepdass003/dockerhub-demo:v1 2>/dev/null || true
docker rmi dockerhub-demo 2>/dev/null || true

echo "Cleanup complete."