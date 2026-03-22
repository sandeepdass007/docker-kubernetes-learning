#!/bin/bash

IMAGE_NAME="delete-file-demo"

echo "======================================"
echo "STEP 1 — Build Image"
echo "======================================"
docker build -t $IMAGE_NAME .

echo ""
echo "======================================"
echo "STEP 2 — Show Image Size"
echo "======================================"
docker images | grep $IMAGE_NAME

echo ""
echo "======================================"
echo "STEP 3 — Show Image Layers"
echo "======================================"
docker history $IMAGE_NAME

echo ""
echo "======================================"
echo "STEP 4 — Run Container"
echo "======================================"
docker run -d --name delete-file-container $IMAGE_NAME
sleep 3
docker ps

echo ""
echo "======================================"
echo "STEP 5 — Check If File Exists"
echo "======================================"
docker exec delete-file-container ls /data || true

echo ""
echo "Notice: File is deleted but image is still large!"