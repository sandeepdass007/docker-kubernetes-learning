#!/bin/bash

echo "Cleaning containers and network..."

docker rm -f bridge-good-server 2>/dev/null || true
docker rm -f bridge-good-client 2>/dev/null || true
docker network rm bridge-good-net 2>/dev/null || true
docker rmi chapter07-bridge-good 2>/dev/null || true

echo "Cleanup complete."