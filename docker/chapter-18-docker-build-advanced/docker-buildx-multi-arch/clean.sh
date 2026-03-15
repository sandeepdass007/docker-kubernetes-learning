#!/bin/bash

docker rmi multiarch-demo 2>/dev/null || true
docker buildx rm multiarch-builder 2>/dev/null || true