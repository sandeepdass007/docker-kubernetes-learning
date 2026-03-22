#!/bin/bash

IMAGE_NAME="layer-cache-demo"

echo "======================================"
echo "STEP 1 — First Build (No Cache)"
echo "======================================"
docker build -t $IMAGE_NAME .

echo ""
echo "======================================"
echo "STEP 2 — Second Build (Should Use Cache)"
echo "======================================"
docker build -t $IMAGE_NAME .

echo ""
echo "======================================"
echo "STEP 3 — Modify app.py (Cache Partially Used)"
echo "======================================"
echo "print('App code changed')" >> app.py
docker build -t $IMAGE_NAME .

echo ""
echo "======================================"
echo "STEP 4 — Modify requirements.txt (Cache Invalidated)"
echo "======================================"
echo "" >> requirements.txt
echo "numpy" >> requirements.txt
docker build -t $IMAGE_NAME .

echo ""
echo "Watch build output:"
echo "- When cache used → 'Using cache'"
echo "- When cache invalid → Layer rebuilds"