#!/bin/bash
set -e

IMAGE_NAME=chapter06-isolated-good

echo "Creating isolated networks..."
docker network create net-a >/dev/null 2>&1 || true
docker network create net-b >/dev/null 2>&1 || true

echo "Building image..."
docker build -t $IMAGE_NAME .

echo
echo "Starting SERVER in net-a..."
docker run -d \
  --name iso-server-good \
  --network net-a \
  -e ROLE=server \
  $IMAGE_NAME

echo
echo "Starting CLIENT in net-b..."
docker run --rm \
  --name iso-client-good \
  --network net-b \
  -e ROLE=client \
  -e SERVER_HOST=server \
  $IMAGE_NAME