#!/bin/bash
set -e

echo "Building image..."
docker build -t chapter06-bad-localhost .

echo
echo "Starting SERVER container..."
docker run -d \
  --name bad-server \
  chapter06-bad-localhost

echo
echo "Starting CLIENT container..."
docker run --rm \
  --name bad-client \
  -e ROLE=client \
  chapter06-bad-localhost
