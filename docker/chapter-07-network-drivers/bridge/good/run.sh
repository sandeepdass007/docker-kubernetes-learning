#!/bin/bash
set -e

NETWORK=bridge-good-net

echo "Creating user-defined bridge network..."
docker network create $NETWORK 2>/dev/null || true

echo "Building image..."
docker build -t chapter07-bridge-good .

echo "Starting SERVER container..."
docker run -d \
  --name bridge-good-server \
  --network $NETWORK \
  chapter07-bridge-good server

echo "Starting CLIENT container..."
docker run --rm \
  --name bridge-good-client \
  --network $NETWORK \
  chapter07-bridge-good client