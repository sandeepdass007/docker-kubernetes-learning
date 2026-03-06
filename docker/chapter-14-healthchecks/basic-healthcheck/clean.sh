#!/bin/bash

echo "Stopping container..."

docker stop health-basic 2>/dev/null || true

echo "Removing container..."

docker rm health-basic 2>/dev/null || true

echo "Removing image..."

docker rmi healthcheck-basic 2>/dev/null || true

echo "Cleanup complete."