#!/bin/bash

# ============================================================
# Script: run_bad.sh
#
# Purpose:
# - Build Docker image using Dockerfile.bad
# - Run the resulting container
#
# This script is intentionally verbose and documented
# to avoid hiding Docker concepts from the learner.
#
# Equivalent manual commands:
#   docker build -f Dockerfile.bad -t chapter03-bad .
#   docker run --rm chapter03-bad
#
# ============================================================

set -e  # Exit immediately if any command fails

IMAGE_NAME="chapter03-bad"
DOCKERFILE="Dockerfile.bad"

echo "Building Docker image using ${DOCKERFILE}..."
docker build -f ${DOCKERFILE} -t ${IMAGE_NAME} .

echo
echo "Running container from image ${IMAGE_NAME}..."
docker run --rm ${IMAGE_NAME}

echo
echo "Done."
