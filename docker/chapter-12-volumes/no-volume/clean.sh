#!/bin/bash

docker rm -f $(docker ps -q --filter ancestor=no-volume-app) 2>/dev/null
docker rmi -f no-volume-app 2>/dev/null

echo "No-volume containers and image cleaned."