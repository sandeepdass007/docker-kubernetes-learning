#!/bin/bash

docker stop dropped-capabilities 2>/dev/null || true
docker rm dropped-capabilities 2>/dev/null || true
docker rmi dropped-capabilities 2>/dev/null || true