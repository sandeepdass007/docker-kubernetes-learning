#!/bin/bash

IMAGE_NAME="layer-demo"

echo "======================================"
echo "STEP 1 — Build Image"
echo "======================================"
docker build -t $IMAGE_NAME .

echo ""
echo "======================================"
echo "STEP 2 — Show Image Layers"
echo "======================================"
docker history $IMAGE_NAME

echo ""
echo "======================================"
echo "STEP 3 — Run Container"
echo "======================================"
docker run -d --name layer-demo-container $IMAGE_NAME

sleep 3
docker ps

echo ""
echo "======================================"
echo "STEP 4 — Inspect Docker Storage"
echo "======================================"
docker inspect layer-demo-container | grep -i overlay -A 5 || true

echo ""
echo "======================================"
echo "STEP 5 — Show Docker Disk Usage"
echo "======================================"
docker system df

echo ""
echo "======================================"
echo "STEP 6 — Enter Container"
echo "======================================"
docker exec -it layer-demo-container bash