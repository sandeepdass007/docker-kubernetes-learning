#!/bin/bash
set -e

echo "Building SERVER image..."
docker build -t chapter09-server .

echo
echo "Running SERVER container..."
docker run \
  --name chapter09-server-container \
  -p 5001:5000 \
  chapter09-server