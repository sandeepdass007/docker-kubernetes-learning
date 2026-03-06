#!/bin/bash

docker build -t env-file-app .

docker run --rm \
-p 5001:5001 \
--env-file .env \
env-file-app