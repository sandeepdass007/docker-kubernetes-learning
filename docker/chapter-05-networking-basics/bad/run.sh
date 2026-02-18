#!/bin/bash
set -e

echo "Building BAD networking image..."
docker build -t chapter05-networking-bad .

echo
echo "Running BAD container..."
docker run --name chapter05-networking-bad chapter05-networking-bad
