#!/bin/bash

echo ""
echo "=================================="
echo "First build (no cache)"
echo "=================================="

DOCKER_BUILDKIT=0 docker build -t build-cache-demo .

echo ""
echo "=================================="
echo "Second build (should use cache)"
echo "=================================="

DOCKER_BUILDKIT=0 docker build -t build-cache-demo .

echo ""
echo "Modifying application code to invalidate cache..."

echo "# change to trigger rebuild" >> app.py

echo ""
echo "=================================="
echo "Third build (partial rebuild)"
echo "=================================="

DOCKER_BUILDKIT=0 docker build -t build-cache-demo .

echo ""
echo "Starting container..."

docker run -d \
  --name build-cache-demo \
  build-cache-demo

sleep 5

docker ps