#!/bin/bash

docker build -t log-rotation-demo .

docker run -d \
  --name log-rotation-demo \
  --log-driver json-file \
  --log-opt max-size=10k \
  --log-opt max-file=3 \
  log-rotation-demo

sleep 5

echo ""
echo "Logging configuration:"
docker inspect log-rotation-demo --format='{{json .HostConfig.LogConfig}}'

echo ""
echo "Total log lines currently stored:"
docker logs log-rotation-demo | wc -l

echo ""
echo "Waiting while logs grow and rotation occurs..."
sleep 10

echo ""
echo "Total log lines after more logs generated:"
docker logs log-rotation-demo | wc -l

echo ""
echo "Recent logs:"
docker logs --tail 10 log-rotation-demo