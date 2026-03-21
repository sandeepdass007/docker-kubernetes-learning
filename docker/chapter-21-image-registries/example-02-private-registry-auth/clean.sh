#!/bin/bash

echo "Cleaning up..."

docker stop private-auth-demo 2>/dev/null || true
docker rm private-auth-demo 2>/dev/null || true

docker stop private-registry 2>/dev/null || true
docker rm private-registry 2>/dev/null || true

docker rmi localhost:5003/private-app:v1 2>/dev/null || true
docker rmi private-app 2>/dev/null || true

echo "Cleanup complete."