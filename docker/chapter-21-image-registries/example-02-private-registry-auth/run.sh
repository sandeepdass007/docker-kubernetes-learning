#!/bin/bash

set -e

echo "============================================================"
echo "CHAPTER 21 — IMAGE REGISTRIES — PRIVATE REGISTRY AUTH DEMO"
echo "============================================================"
echo ""

echo "[Step 1] Starting Private Docker Registry on port 5003..."
docker run -d -p 5003:5000 --name private-registry registry:2 2>/dev/null || true
sleep 3
echo "Registry started."
docker ps
echo ""

echo "[Step 2] Building Docker Image..."
docker build -t private-app .
echo "Image build complete."
echo "Listing images:"
docker images | grep private-app
echo ""

echo "[Step 3] Tagging image for private registry..."
echo "Tag format: <registry>/<image>:<tag>"
echo "Example: localhost:5003/private-app:v1"
docker tag private-app localhost:5003/private-app:v1
echo "Tagging complete."
echo ""

echo "[Step 4] Pushing image to private registry..."
echo "This simulates CI/CD pushing image to registry..."
docker push localhost:5003/private-app:v1
echo "Push complete."
echo ""

echo "[Step 5] Removing local image to simulate NEW MACHINE..."
docker rmi localhost:5003/private-app:v1
echo "Local image removed."
echo "If this were a real server, image would not exist locally."
echo ""

echo "[Step 6] Pulling image from registry..."
echo "This simulates server/Kubernetes pulling image..."
docker pull localhost:5003/private-app:v1
echo "Pull complete."
echo ""

echo "[Step 7] Running container from pulled image..."
docker run -d \
  --name private-auth-demo \
  -p 5005:5005 \
  localhost:5003/private-app:v1

sleep 5

echo ""
echo "[Step 8] Running containers:"
docker ps
echo ""

echo "[Step 9] Container logs:"
docker logs private-auth-demo
echo ""

echo "============================================================"
echo "DEMO COMPLETE"
echo "Open browser: http://localhost:5005"
echo "============================================================"