#!/bin/bash

docker build -t logging-driver-fluentd .

docker run -d \
  --name logging-driver-fluentd \
  --log-driver fluentd \
  --log-opt fluentd-address=localhost:24224 \
  logging-driver-fluentd

sleep 5

docker ps

echo ""
echo "Inspecting logging configuration..."
docker inspect logging-driver-fluentd --format='{{json .HostConfig.LogConfig}}'

echo ""
echo "If Fluentd is not running, Docker may report a logging connection error."