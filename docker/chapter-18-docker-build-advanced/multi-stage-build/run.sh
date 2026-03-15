#!/bin/bash

echo ""
echo "================================="
echo "Building multi-stage image"
echo "================================="

docker build -t multi-stage-demo .

echo ""
echo "Running container..."

docker run -d \
  --name multi-stage-demo \
  multi-stage-demo

sleep 3

docker ps