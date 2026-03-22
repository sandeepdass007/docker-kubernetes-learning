#!/bin/bash

DOCKERHUB_USER="sandeepdass003"
IMAGE_NAME="private-registry-demo"

echo "======================================"
echo "STEP 1 — Build Image"
echo "======================================"
docker build -t $IMAGE_NAME .

echo "======================================"
echo "STEP 2 — Tag and Push to Docker Hub"
echo "IMPORTANT: Make this repo PRIVATE on Docker Hub before running"
echo "======================================"
docker tag $IMAGE_NAME $DOCKERHUB_USER/$IMAGE_NAME:v1
docker push $DOCKERHUB_USER/$IMAGE_NAME:v1

echo "======================================"
echo "STEP 3 — Logout from Docker"
echo "======================================"
docker logout

echo "======================================"
echo "STEP 4 — Try Pulling Private Image (Should Fail)"
echo "======================================"
docker pull $DOCKERHUB_USER/$IMAGE_NAME:v1 || true

echo "======================================"
echo "STEP 5 — Login Again"
echo "======================================"
docker login

echo "======================================"
echo "STEP 6 — Pull Image (Should Succeed)"
echo "======================================"
docker pull $DOCKERHUB_USER/$IMAGE_NAME:v1

echo "======================================"
echo "STEP 7 — Run Container"
echo "======================================"
docker stop $IMAGE_NAME 2>/dev/null || true
docker rm $IMAGE_NAME 2>/dev/null || true

docker run -d \
  --name $IMAGE_NAME \
  -p 5008:5008 \
  $DOCKERHUB_USER/$IMAGE_NAME:v1

sleep 5
docker ps

echo "======================================"
echo "Logs:"
echo "======================================"
docker logs $IMAGE_NAME