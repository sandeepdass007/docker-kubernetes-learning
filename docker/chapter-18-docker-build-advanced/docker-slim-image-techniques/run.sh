#!/bin/bash

echo ""
echo "Building STANDARD image..."
docker build -f Dockerfile.standard -t demo-standard .

echo ""
echo "Building SLIM image..."
docker build -f Dockerfile.slim -t demo-slim .

echo ""
echo "Building DISTROLESS image..."
docker build -f Dockerfile.distroless -t demo-distroless .

echo ""
echo "Image size comparison:"
docker images | grep demo

echo ""
echo "Running optimized container..."
docker run --rm demo-slim