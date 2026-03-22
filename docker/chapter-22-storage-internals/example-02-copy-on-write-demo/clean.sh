#!/bin/bash

docker stop cow-container-1 2>/dev/null || true
docker stop cow-container-2 2>/dev/null || true
docker rm cow-container-1 2>/dev/null || true
docker rm cow-container-2 2>/dev/null || true
docker rmi copy-on-write-demo 2>/dev/null || true