#!/bin/bash

echo ""
echo "==============================="
echo "Building ONLY builder stage"
echo "==============================="

docker build \
  --target builder \
  -t builder-demo .

echo ""
echo "Builder image created."

echo ""
echo "==============================="
echo "Building full production image"
echo "==============================="

docker build -t production-demo .

echo ""
echo "Running production container..."

docker run --rm production-demo