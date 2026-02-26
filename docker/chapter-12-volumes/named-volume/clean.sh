#!/bin/bash

CONTAINER_NAME=named-volume-server
VOLUME_NAME=chapter12-data

echo "Stopping container..."
docker rm -f $CONTAINER_NAME 2>/dev/null || true

echo "Removing named volume..."
docker volume rm $VOLUME_NAME 2>/dev/null || true

echo "Cleanup complete."