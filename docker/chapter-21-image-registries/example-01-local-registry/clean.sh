#!/bin/bash

docker stop local-registry-demo 2>/dev/null || true
docker rm local-registry-demo 2>/dev/null || true

docker stop local-registry 2>/dev/null || true
docker rm local-registry 2>/dev/null || true

docker rmi localhost:5001/my-app:v1 2>/dev/null || true
docker rmi my-app 2>/dev/null || true