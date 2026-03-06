#!/bin/bash

echo "Stopping container..."

docker stop env-hardcoded-container 2>/dev/null

echo "Removing container..."

docker rm env-hardcoded-container 2>/dev/null

echo "Removing image..."

docker rmi env-hardcoded-app 2>/dev/null