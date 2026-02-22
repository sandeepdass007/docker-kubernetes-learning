#!/bin/bash
set -e

echo "Stopping and removing SERVER container..."
docker rm -f chapter09-server-container 2>/dev/null || true

echo "Removing SERVER image..."
docker rmi chapter09-server 2>/dev/null || true