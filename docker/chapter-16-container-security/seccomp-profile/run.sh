#!/bin/bash

echo "Building image..."
docker build -t seccomp-demo .

echo ""
echo "Running container WITH seccomp restriction..."
docker run \
    --security-opt seccomp=seccomp-deny-clone.json \
    --name seccomp-test \
    seccomp-demo