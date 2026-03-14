#!/bin/bash

echo "Stopping container..."
docker stop cpu-limit-demo 2>/dev/null || true

echo "Removing container..."
docker rm cpu-limit-demo 2>/dev/null || true

echo "Removing image..."
docker rmi cpu-limit-demo 2>/dev/null || true

echo "Cleanup complete."