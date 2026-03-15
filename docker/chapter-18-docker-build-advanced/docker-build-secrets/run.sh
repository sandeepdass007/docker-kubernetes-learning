#!/bin/bash

echo ""
echo "================================="
echo "Building image with secret"
echo "================================="

DOCKER_BUILDKIT=1 docker build \
  --secret id=mysecret,src=secret.txt \
  -t build-secret-demo .

echo ""
echo "Running container..."

docker run --rm build-secret-demo

docker history build-secret-demo