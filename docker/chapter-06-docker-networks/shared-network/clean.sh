#!/bin/bash

docker rm -f shared-server >/dev/null 2>&1 || true
docker network rm shared-net >/dev/null 2>&1 || true

echo "Cleanup complete."