#!/bin/bash

docker build -t healthcheck-failing .

docker run -d \
  -p 5002:5002 \
  --name health-failing \
  healthcheck-failing

echo ""
echo "================================"
echo "Container started..."
echo "================================"
echo ""

echo "Waiting 15 seconds for startup..."
sleep 15

echo ""
echo "Checking container status..."
echo ""

docker ps

echo ""
echo "Waiting for 60 seconds to allow health check to fail..."
sleep 60
echo ""

docker ps