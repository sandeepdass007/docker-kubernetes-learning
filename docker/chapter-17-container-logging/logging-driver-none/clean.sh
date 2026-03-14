#!/bin/bash

docker stop logging-driver-none 2>/dev/null || true
docker rm logging-driver-none 2>/dev/null || true
docker rmi logging-driver-none 2>/dev/null || true