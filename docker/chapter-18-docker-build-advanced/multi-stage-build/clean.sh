#!/bin/bash

docker stop multi-stage-demo 2>/dev/null || true
docker rm multi-stage-demo 2>/dev/null || true
docker rmi multi-stage-demo 2>/dev/null || true