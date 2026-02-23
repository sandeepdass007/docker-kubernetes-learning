#!/bin/bash

docker rm -f $(docker ps -q --filter ancestor=volume-app) 2>/dev/null
docker rmi -f volume-app 2>/dev/null
docker volume rm volume-data 2>/dev/null

echo "Volume, containers, and image cleaned."