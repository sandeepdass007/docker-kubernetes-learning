#!/bin/bash
set -e

docker rm -f chapter05-networking-good 2>/dev/null || true
docker rmi chapter05-networking-good 2>/dev/null || true
