#!/bin/bash

docker build -t dropped-capabilities .

docker run -d \
  --name dropped-capabilities \
  --cap-drop ALL \
  dropped-capabilities

sleep 5

docker ps

echo ""
echo "Container logs:"
docker logs dropped-capabilities