#!/bin/bash

echo "Stopping container..."
docker stop memory-limit-demo 2>/dev/null || true

echo "Removing container..."
docker rm memory-limit-demo 2>/dev/null || true

echo "Removing image..."
docker rmi memory-limit-demo 2>/dev/null || true

echo "Cleanup complete."