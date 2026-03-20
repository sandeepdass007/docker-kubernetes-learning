#!/bin/bash

echo "========== DOCKER LOGS =========="
docker logs -f debug-demo &
sleep 5
pkill -f "docker logs"

echo ""
echo "========== DOCKER INSPECT =========="
docker inspect debug-demo | head -n 40

echo ""
echo "========== DOCKER STATS =========="
docker stats --no-stream debug-demo

echo ""
echo "========== DOCKER TOP =========="
docker top debug-demo