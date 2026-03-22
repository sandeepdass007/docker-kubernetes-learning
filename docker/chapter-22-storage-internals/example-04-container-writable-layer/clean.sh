#!/bin/bash

docker stop writable-layer-container 2>/dev/null || true
docker rm writable-layer-container 2>/dev/null || true
docker rmi writable-layer-demo 2>/dev/null || true