#!/bin/bash

docker build -t healthcheck-basic .

docker run --rm -d \
  -p 5001:5001 \
  --name health-basic \
  healthcheck-basic

echo ""
echo "Container started..."
echo ""

echo "Waiting for 15 seconds so that the container can be started properly..."

sleep 15

docker ps