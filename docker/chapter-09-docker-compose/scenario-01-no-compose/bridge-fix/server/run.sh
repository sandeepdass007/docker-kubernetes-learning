#!/bin/bash
set -e

echo "Building SERVER image..."
docker build -t chapter9-bridge-server .

echo "Running SERVER container on bridge network..."
docker run -d \
  --name chapter9-server \
  --network chapter9-bridge \
  chapter9-bridge-server