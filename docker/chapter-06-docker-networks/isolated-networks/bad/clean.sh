#!/bin/bash

docker rm -f server 2>/dev/null || true
docker network rm net-a net-b 2>/dev/null || true

echo "Cleaned up containers and networks."