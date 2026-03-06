#!/bin/bash

docker stop health-basic 2>/dev/null || true
docker rm -f health-basic 2>/dev/null || true

docker rmi healthcheck-basic 2>/dev/null || true