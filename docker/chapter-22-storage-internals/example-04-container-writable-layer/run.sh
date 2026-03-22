#!/bin/bash

IMAGE_NAME="writable-layer-demo"

echo "======================================"
echo "STEP 1 — Build Image"
echo "======================================"
docker build -t $IMAGE_NAME .

echo ""
echo "======================================"
echo "STEP 2 — Run Container"
echo "======================================"
docker run -d --name writable-layer-container $IMAGE_NAME

sleep 3
docker ps -s

echo ""
echo "======================================"
echo "STEP 3 — Write Large File Inside Container (200MB)"
echo "======================================"
docker exec writable-layer-container bash -c "dd if=/dev/zero of=/data/bigfile.bin bs=1M count=200"

echo ""
echo "======================================"
echo "STEP 4 — Check Container Size Again"
echo "======================================"
docker ps -s

echo ""
echo "======================================"
echo "STEP 5 — Check Docker Disk Usage"
echo "======================================"
docker system df