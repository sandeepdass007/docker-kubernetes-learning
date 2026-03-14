#!/bin/bash

docker stop non-root-container 2>/dev/null || true
docker rm non-root-container 2>/dev/null || true
docker rmi non-root-container 2>/dev/null || true