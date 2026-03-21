#!/bin/bash

docker stop latest-tag-demo 2>/dev/null || true
docker rm latest-tag-demo 2>/dev/null || true
docker rmi latest-tag-demo 2>/dev/null || true
docker rmi sandeepdass003/latest-tag-demo:latest 2>/dev/null || true