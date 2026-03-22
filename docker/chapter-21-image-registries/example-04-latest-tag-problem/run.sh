#!/bin/bash

DOCKERHUB_USER="sandeepdass003"
IMAGE_NAME="latest-tag-demo"

echo "======================================"
echo "STEP 1 — Build V1 and push as latest"
echo "======================================"

cp app_v1.py app.py

docker build -t $IMAGE_NAME .
docker tag $IMAGE_NAME $DOCKERHUB_USER/$IMAGE_NAME:latest
docker push $DOCKERHUB_USER/$IMAGE_NAME:latest

echo "Running container with V1..."
docker stop $IMAGE_NAME 2>/dev/null || true
docker rm $IMAGE_NAME 2>/dev/null || true

docker run -d \
  --name $IMAGE_NAME \
  -p 5007:5007 \
  $DOCKERHUB_USER/$IMAGE_NAME:latest

sleep 5
docker ps
docker logs $IMAGE_NAME

echo ""
echo "======================================"
echo "STEP 2 — Build V2 and push as latest"
echo "======================================"

cp app_v2.py app.py

docker build -t $IMAGE_NAME .
docker tag $IMAGE_NAME $DOCKERHUB_USER/$IMAGE_NAME:latest
docker push $DOCKERHUB_USER/$IMAGE_NAME:latest

echo "New image pushed as latest (V2)"
echo "But container still running old version..."

sleep 3
docker logs $IMAGE_NAME

echo ""
echo "======================================"
echo "STEP 3 — Force pull and recreate container"
echo "======================================"

docker pull $DOCKERHUB_USER/$IMAGE_NAME:latest
docker stop $IMAGE_NAME
docker rm $IMAGE_NAME

docker run -d \
  --name $IMAGE_NAME \
  -p 5007:5007 \
  $DOCKERHUB_USER/$IMAGE_NAME:latest

sleep 5
docker logs $IMAGE_NAME

echo ""
echo "Demo Complete:"
echo "Step 1 -> V1"
echo "Step 2 -> Still V1 (latest problem)"
echo "Step 3 -> V2 after pull"