#!/bin/bash

docker rm -f iso-server-good >/dev/null 2>&1 || true
docker network rm net-a net-b >/dev/null 2>&1 || true

echo "Cleanup complete."