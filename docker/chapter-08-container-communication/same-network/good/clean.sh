#!/bin/bash

docker rm -f same-server 2>/dev/null || true
docker network rm chapter08-net 2>/dev/null || true