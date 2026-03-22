#!/bin/bash

docker stop delete-file-container 2>/dev/null || true
docker rm delete-file-container 2>/dev/null || true
docker rmi delete-file-demo 2>/dev/null || true