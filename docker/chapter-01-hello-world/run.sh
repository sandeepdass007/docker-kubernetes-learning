#!/usr/bin/env bash
set -e
# -e means:
# Exit immediately if any command fails.
# This prevents half-broken executions.

# -------------------------------
# Configuration
# -------------------------------
IMAGE_NAME="docker-hello-world"

echo "🐳 Docker Hello World — Chapter 1"
echo ""

# -------------------------------
# Step 1: Build the Docker image
# -------------------------------
# docker build:
# - Reads the Dockerfile in the current directory
# - Creates a Docker image
#
# -t assigns a human-readable name (tag)
echo "📦 Building Docker image: $IMAGE_NAME"
docker build -t $IMAGE_NAME .

# -------------------------------
# Step 2: Run the container
# -------------------------------
# docker run:
# - Creates a container from the image
# - Executes CMD defined in the Dockerfile
#
# --rm:
# - Automatically deletes the container
#   after it finishes execution
echo ""
echo "🚀 Running Docker container..."
docker run --rm $IMAGE_NAME

echo ""
echo "✅ Chapter 1 execution completed"
