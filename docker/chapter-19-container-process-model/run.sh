#!/bin/bash

echo "Building images..."

docker build -t process-bad ./bad-shell-form
docker build -t process-good ./good-exec-form
docker build -t process-tini ./tini-init

echo ""
echo "Running BAD container..."
docker run -d --name bad-demo process-bad

echo "Running GOOD container..."
docker run -d --name good-demo process-good

echo "Running TINI container..."
docker run -d --name tini-demo process-tini

echo ""
echo "Containers started."

docker ps