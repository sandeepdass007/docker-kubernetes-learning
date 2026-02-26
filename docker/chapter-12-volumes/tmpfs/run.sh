#!/bin/bash

docker build -t tmpfs-app .

docker run --rm \
  -p 5001:5001 \
  --tmpfs /data \
  tmpfs-app