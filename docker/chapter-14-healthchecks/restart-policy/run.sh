#!/bin/bash

docker build -t restart-policy-demo .

docker run -d \
  --name restart-demo \
  --restart=always \
  restart-policy-demo

echo ""
echo "Container started..."
echo ""

for i in {1..5}; do
    echo "Check $i of 5:\n"
    echo "Waiting 10 seconds...\n"
    sleep 15
    docker ps
done