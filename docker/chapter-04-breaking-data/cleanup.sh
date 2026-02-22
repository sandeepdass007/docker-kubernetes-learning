#!/bin/bash

echo "Stopping and removing container..."
docker rm -f chapter04-container 2>/dev/null || true

echo "Removing image..."
docker rmi chapter04-breaking-data 2>/dev/null || true

echo "Removing volume..."
docker volume rm chapter04-data 2>/dev/null || true

echo "Cleanup complete."
echo "Any data inside the container is now PERMANENTLY LOST."
