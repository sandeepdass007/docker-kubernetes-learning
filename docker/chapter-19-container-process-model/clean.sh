#!/bin/bash

docker rm -f bad-demo good-demo tini-demo 2>/dev/null

docker rmi process-bad process-good process-tini 2>/dev/null

echo "Cleaned up containers and images."