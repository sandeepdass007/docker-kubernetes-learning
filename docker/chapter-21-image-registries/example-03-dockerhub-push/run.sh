#!/bin/bash

set -e

echo "============================================================"
echo "CHAPTER 21 — DOCKER HUB PUSH & PULL DEMO"
echo "============================================================"
echo ""

echo "[Step 1] Building Docker image..."
docker build -t dockerhub-demo .
echo "Image built successfully."
docker images | grep dockerhub-demo
echo ""

echo "[Step 2] Logging into Docker Hub..."
echo "You must login to push images to Docker Hub."
docker login
echo "Login successful."
echo ""

echo "[Step 3] Tagging image for Docker Hub..."
echo "Tag format: <dockerhub-username>/<image>:<tag>"
echo "Example: username/dockerhub-demo:v1"
docker tag dockerhub-demo sandeepdass003/dockerhub-demo:v1
echo "Tagging complete."
echo ""

echo "[Step 4] Pushing image to Docker Hub..."
echo "This simulates CI/CD pushing image to remote registry..."
docker push sandeepdass003/dockerhub-demo:v1
echo "Push complete."
echo ""

echo "[Step 5] Removing local image to simulate NEW SERVER..."
docker rmi sandeepdass003/dockerhub-demo:v1
echo "Local image removed."
echo ""

echo "[Step 6] Pulling image from Docker Hub..."
echo "This simulates production server pulling image..."
docker pull sandeepdass003/dockerhub-demo:v1
echo "Pull complete."
echo ""

echo "[Step 7] Running container from pulled image..."
docker run -d \
  --name dockerhub-demo-container \
  -p 5006:5006 \
  sandeepdass003/dockerhub-demo:v1

sleep 5

echo ""
echo "[Step 8] Running containers:"
docker ps
echo ""

echo "[Step 9] Container logs:"
docker logs dockerhub-demo-container
echo ""

echo "============================================================"
echo "DEMO COMPLETE"
echo "Open browser: http://localhost:5006"
echo "============================================================"