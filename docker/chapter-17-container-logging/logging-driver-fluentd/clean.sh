#!/bin/bash

docker stop logging-driver-fluentd 2>/dev/null || true
docker rm logging-driver-fluentd 2>/dev/null || true
docker rmi logging-driver-fluentd 2>/dev/null || true