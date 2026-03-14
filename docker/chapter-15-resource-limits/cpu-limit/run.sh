#!/bin/bash

docker build -t cpu-limit-demo .

docker run -d \
  --name cpu-limit-demo \
  --cpus="0.5" \
  cpu-limit-demo

echo ""
echo "Container started..."
echo ""

echo "Waiting 10 seconds..."
sleep 10

docker ps