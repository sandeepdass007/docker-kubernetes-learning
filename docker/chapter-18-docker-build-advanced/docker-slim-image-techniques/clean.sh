#!/bin/bash

docker rmi demo-standard 2>/dev/null || true
docker rmi demo-slim 2>/dev/null || true
docker rmi demo-distroless 2>/dev/null || true