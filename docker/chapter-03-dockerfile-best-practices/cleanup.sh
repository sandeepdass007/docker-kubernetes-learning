#!/bin/bash

echo "Cleaning up Docker containers and images for Chapter 03..."

# Stop and remove containers (if they exist)
for container in chapter03-bad-container chapter03-good-container
do
  if docker ps -a --format '{{.Names}}' | grep -q "^${container}$"; then
    echo "Stopping and removing container: $container"
    docker rm -f $container
  else
    echo "Container not found: $container (skipping)"
  fi
done

# Remove images (if they exist)
for image in chapter03-bad chapter03-good
do
  if docker images --format '{{.Repository}}' | grep -q "^${image}$"; then
    echo "Removing image: $image"
    docker rmi -f $image
  else
    echo "Image not found: $image (skipping)"
  fi
done

echo "Cleanup complete."
