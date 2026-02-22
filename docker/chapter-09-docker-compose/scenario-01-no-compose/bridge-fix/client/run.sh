#!/bin/bash
set -e

echo "Building CLIENT image..."
docker build -t chapter9-bridge-client .

echo "Running CLIENT container on bridge network..."
docker run --rm \
  --network chapter9-bridge \
  chapter9-bridge-client