#!/bin/bash

docker rm -f bad-server 2>/dev/null || true
docker rmi chapter06-bad-localhost 2>/dev/null || true

echo "Cleanup complete."
