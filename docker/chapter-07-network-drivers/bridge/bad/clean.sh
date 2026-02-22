#!/bin/bash

echo "Cleaning Bridge BAD containers..."

docker rm -f bridge-bad-server 2>/dev/null || true
docker rm -f bridge-bad-client 2>/dev/null || true
docker rmi chapter07-bridge-bad 2>/dev/null || true

echo "Cleanup complete."