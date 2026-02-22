#!/bin/bash
set -e

echo "Building image..."
docker build -t chapter08-isolated .

echo "Starting SERVER container..."
docker run -d \
  --name isolated-server \
  chapter08-isolated \
  python app.py server

echo "Starting CLIENT container..."
docker run --rm \
  --name isolated-client \
  chapter08-isolated \
  python app.py client