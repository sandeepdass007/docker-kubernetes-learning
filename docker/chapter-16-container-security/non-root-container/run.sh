#!/bin/bash

docker build -t non-root-container .

docker run -d \
  --name non-root-container \
  non-root-container

sleep 5

docker ps

echo ""
echo "Container logs:"
docker logs -f non-root-container