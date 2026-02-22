#!/bin/bash

IMAGE_NAME=chapter07-host-network

echo "Cleaning up host network example..."

docker rmi -f $IMAGE_NAME 2>/dev/null || true

echo "Cleanup complete."