#!/bin/bash

IMAGE_NAME="copy-on-write-demo"

echo "======================================"
echo "STEP 1 — Build Image"
echo "======================================"
docker build -t $IMAGE_NAME .

echo ""
echo "======================================"
echo "STEP 2 — Run Container 1"
echo "======================================"
docker run -d --name cow-container-1 $IMAGE_NAME
sleep 3

echo "Original content in Container 1:"
docker exec cow-container-1 cat /data/file.txt

echo ""
echo "Modifying file in Container 1..."
docker exec cow-container-1 bash -c "echo 'Modified by Container 1' >> /data/file.txt"

echo "Updated content in Container 1:"
docker exec cow-container-1 cat /data/file.txt

echo ""
echo "======================================"
echo "STEP 3 — Run Container 2 from Same Image"
echo "======================================"
docker run -d --name cow-container-2 $IMAGE_NAME
sleep 3

echo "Content in Container 2 (Should be original):"
docker exec cow-container-2 cat /data/file.txt

echo ""
echo "======================================"
echo "STEP 4 — Show Containers"
echo "======================================"
docker ps