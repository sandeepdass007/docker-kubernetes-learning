#!/bin/bash

docker build -t bind-mount-app .

docker run -it --rm \
  -p 5001:5001 \
  -v $(pwd)/host-data:/data \
  bind-mount-app