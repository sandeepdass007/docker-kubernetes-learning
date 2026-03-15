#!/bin/bash

docker stop build-cache-demo 2>/dev/null || true
docker rm build-cache-demo 2>/dev/null || true
docker rmi build-cache-demo 2>/dev/null || true