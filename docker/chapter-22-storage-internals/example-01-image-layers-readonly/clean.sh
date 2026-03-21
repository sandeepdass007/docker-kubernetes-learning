#!/bin/bash

docker stop layer-demo-container 2>/dev/null || true
docker rm layer-demo-container 2>/dev/null || true
docker rmi layer-demo 2>/dev/null || true