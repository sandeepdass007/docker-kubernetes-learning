#!/bin/bash

docker build -t json-file-demo .

docker run -d \
  --name json-log-demo \
  json-file-demo

sleep 3

echo ""
echo "Container logs via docker logs:"
docker logs json-log-demo

echo ""
echo "Inspecting container logging configuration..."
docker inspect json-log-demo --format='{{json .HostConfig.LogConfig}}'

echo ""
echo "Docker log file path from inspect:"
docker inspect json-log-demo --format='{{.LogPath}}'