#!/bin/bash

docker build -t logging-driver-local .

docker run -d \
  --name logging-driver-local \
  --log-driver local \
  logging-driver-local

sleep 5

docker ps

echo ""
echo "Inspecting logging driver..."
docker inspect logging-driver-local --format='{{.HostConfig.LogConfig.Type}}'

echo ""
echo "Following container logs..."
docker logs -f logging-driver-local