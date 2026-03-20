#!/bin/bash

docker rm -f debug-demo 2>/dev/null
docker rmi debug-container 2>/dev/null

echo "Cleanup complete."