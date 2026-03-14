#!/bin/bash

echo "Building Docker image..."
docker build -t basic-logging-demo .

echo ""
echo "Starting container..."

docker run -d \
  --name logging-demo \
  basic-logging-demo

echo ""
echo "Waiting for logs to generate..."
sleep 3

echo ""
echo "Showing container logs:"
docker logs logging-demo

echo ""
echo "Following logs (press CTRL+C to stop)..."
docker logs -f logging-demo