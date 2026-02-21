#!/bin/bash

IMAGE_NAME=chapter07-none-network

echo "Cleaning up none network example..."

docker rmi -f $IMAGE_NAME 2>/dev/null || true

echo "Cleanup complete."