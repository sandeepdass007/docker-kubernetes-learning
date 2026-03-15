#!/bin/bash

docker rmi builder-demo 2>/dev/null || true
docker rmi production-demo 2>/dev/null || true