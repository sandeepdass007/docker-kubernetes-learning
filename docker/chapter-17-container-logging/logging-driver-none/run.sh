#!/bin/bash

docker build -t logging-driver-none .

docker run -d \
  --name logging-driver-none \
  --log-driver none \
  logging-driver-none

sleep 5

docker ps

echo ""
echo "Inspecting logging driver..."
docker inspect logging-driver-none --format='{{.HostConfig.LogConfig.Type}}'

echo ""
echo "Attempting to fetch container logs..."

docker logs logging-driver-none