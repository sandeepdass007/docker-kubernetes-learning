#!/bin/bash

docker build -t no-new-privileges .

docker run -d \
  --name no-new-privileges \
  --security-opt no-new-privileges \
  no-new-privileges

sleep 5

docker ps

echo ""
echo "Container logs:"
docker logs no-new-privileges