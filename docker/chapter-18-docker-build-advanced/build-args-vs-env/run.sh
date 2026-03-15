#!/bin/bash

echo ""
echo "=============================="
echo "Build with default ARG value"
echo "=============================="

docker build -t args-env-demo .

echo ""
echo "Running container with default ENV"

docker run --rm args-env-demo

echo ""
echo "=============================="
echo "Build with custom ARG value"
echo "=============================="

docker build \
  --build-arg APP_VERSION=2.5 \
  -t args-env-demo .

docker run --rm args-env-demo

echo ""
echo "=============================="
echo "Override ENV at runtime"
echo "=============================="

docker run \
  -e APP_ENV=production \
  --rm args-env-demo