#!/usr/bin/env bash
set -e

# -------------------------------
# Cleanup Script
# -------------------------------
# This script removes the Docker image
# created in this chapter.
#
# Why cleanup?
# - Saves disk space
# - Prevents confusion in later chapters
# - Teaches good Docker hygiene early

IMAGE_NAME="docker-hello-world"

echo "🧹 Cleaning up Docker image: $IMAGE_NAME"

# docker rmi:
# - Removes a Docker image
#
# || true:
# - Prevents script failure if image
#   does not exist
docker rmi -f $IMAGE_NAME || true

echo "✅ Cleanup completed"
