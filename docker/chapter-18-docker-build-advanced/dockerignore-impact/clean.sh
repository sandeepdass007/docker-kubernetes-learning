#!/bin/bash

docker stop dockerignore-impact 2>/dev/null || true
docker rm dockerignore-impact 2>/dev/null || true
docker rmi dockerignore-impact 2>/dev/null || true

rm -f large-dummy-file.bin