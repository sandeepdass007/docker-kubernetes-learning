#!/bin/bash

docker stop private-registry-demo 2>/dev/null || true
docker rm private-registry-demo 2>/dev/null || true
docker rmi private-registry-demo 2>/dev/null || true
docker rmi sandeepdass003/private-registry-demo:v1 2>/dev/null || true