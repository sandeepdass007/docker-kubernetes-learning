#!/bin/bash

echo "Stopping container..."
docker stop health-failing 2>/dev/null || true

echo "Removing container..."
docker rm health-failing 2>/dev/null || true

echo "Removing image..."
docker rmi healthcheck-failing 2>/dev/null || true

echo "Cleanup complete."