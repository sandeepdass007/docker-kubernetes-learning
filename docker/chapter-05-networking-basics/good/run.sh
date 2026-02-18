#!/bin/bash
set -e

echo "Building GOOD networking image..."
docker build -t chapter05-networking-good .

echo
echo "Running GOOD container with port mapping..."
docker run \
  --name chapter05-networking-good \
  -p 8000:8000 \
  chapter05-networking-good
