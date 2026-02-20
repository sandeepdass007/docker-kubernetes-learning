#!/bin/bash
set -e

echo "Running Bridge BAD example"
echo "Both server and client will start"
echo "Client will FAIL due to localhost misuse"

docker build -t chapter07-bridge-bad .

echo "Starting SERVER container..."
docker run -d \
  --name bridge-bad-server \
  chapter07-bridge-bad server

echo "Starting CLIENT container..."
docker run --rm \
  --name bridge-bad-client \
  chapter07-bridge-bad client