#!/bin/bash

docker stop logging-driver-local 2>/dev/null || true
docker rm logging-driver-local 2>/dev/null || true
docker rmi logging-driver-local 2>/dev/null || true