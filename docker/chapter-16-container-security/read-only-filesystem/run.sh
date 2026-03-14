#!/bin/bash

docker build -t read-only-filesystem .

docker run -d \
  --name read-only-filesystem \
  --read-only \
  read-only-filesystem

sleep 5

docker ps

echo ""
echo "Container logs:"
docker logs read-only-filesystem