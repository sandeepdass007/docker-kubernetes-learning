#!/bin/bash

echo "Cleaning CLIENT artifacts..."

docker rmi -f chapter09-client 2>/dev/null || true

echo "Client cleanup complete."