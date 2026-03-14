#!/bin/bash

docker build -t memory-limit-demo .

docker run -d \
  --name memory-limit-demo \
  --memory="100m" \
  memory-limit-demo

echo ""
echo "Container started..."
echo ""

echo "Waiting 5 seconds..."
sleep 5

docker ps -a