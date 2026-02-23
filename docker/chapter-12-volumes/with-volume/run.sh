#!/bin/bash

docker build -t volume-app .

docker run --rm \
  -p 5001:5001 \
  -v volume-data:/data \
  volume-app