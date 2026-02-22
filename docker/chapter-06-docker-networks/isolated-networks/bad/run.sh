#!/bin/bash
set -e

echo "Creating isolated networks..."
docker network create net-a || true
docker network create net-b || true

docker build -t chapter06-isolation .

echo
echo "Starting SERVER in net-a..."
docker run -d \
  --name server \
  --network net-a \
  -e ROLE=server \
  chapter06-isolation

echo
echo "Starting CLIENT in net-b (should FAIL)..."
docker run --rm \
  --network net-b \
  -e ROLE=client \
  chapter06-isolation