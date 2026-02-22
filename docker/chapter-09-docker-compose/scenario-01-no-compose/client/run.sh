#!/bin/bash
set -e

echo
echo "Running CLIENT container..."
echo "This container will try to reach http://localhost:5001"
echo "It is EXPECTED to fail."
echo

docker build -t chapter09-client .

docker run --rm chapter09-client