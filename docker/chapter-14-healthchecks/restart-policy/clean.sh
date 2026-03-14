#!/bin/bash

echo "Stopping container..."
docker stop restart-demo 2>/dev/null || true

echo "Removing container..."
docker rm restart-demo 2>/dev/null || true

echo "Removing image..."
docker rmi restart-policy-demo 2>/dev/null || true

echo "Cleanup complete."