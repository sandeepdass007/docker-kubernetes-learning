#!/bin/bash

docker build -t no-volume-app .

docker run --rm -p 5001:5001 no-volume-app