# Docker Buildx Multi-Architecture Images

## Overview

Modern systems run on different CPU architectures such as:

-   **AMD64 (x86_64)** → Most cloud servers and traditional computers
-   **ARM64** → Apple Silicon Macs, Raspberry Pi, AWS Graviton

If you build a Docker image normally, it only supports **the
architecture of the machine where it was built**.

Docker **Buildx** allows building **multi-architecture images** that can
run on multiple CPU types from a single image tag.

This example demonstrates how to build Docker images that support both
**AMD64 and ARM64**.

------------------------------------------------------------------------

## Why Multi-Architecture Images Matter

Without multi-arch builds:

-   Images built on Apple Silicon may not run on x86 servers
-   Images built on x86 may not run on ARM systems
-   Teams working across different hardware face compatibility issues

With multi-arch images:

-   One image tag supports multiple architectures
-   Docker automatically pulls the correct version
-   CI/CD pipelines become more flexible

------------------------------------------------------------------------

## Project Structure

    docker-buildx-multi-arch/
    │
    ├── app.py
    ├── Dockerfile
    ├── run.sh
    ├── clean.sh
    └── README.md

------------------------------------------------------------------------

## Dockerfile

The Dockerfile itself does not require major changes.

    FROM python:3.11-slim

    WORKDIR /app

    COPY app.py .

    CMD ["python", "app.py"]

Docker Buildx handles the architecture differences during the build
process.

------------------------------------------------------------------------

## Enabling Docker Buildx

Check if Buildx is available:

    docker buildx version

If needed, create a builder:

    docker buildx create --use

------------------------------------------------------------------------

## Building Multi-Architecture Images

Use the `--platform` option to specify architectures.

Example:

    docker buildx build   --platform linux/amd64,linux/arm64   -t my-multiarch-demo   .

This builds images for both platforms.

------------------------------------------------------------------------

## Pushing Multi-Arch Images

To push multi-architecture images to a registry:

    docker buildx build   --platform linux/amd64,linux/arm64   -t username/myapp:latest   --push   .

Docker will publish a **manifest** containing multiple architecture
images.

When users pull the image:

    docker pull username/myapp:latest

Docker automatically downloads the correct architecture version.

------------------------------------------------------------------------

## Running the Example

Run:

    ./run.sh

The script demonstrates building the image using Docker Buildx.

------------------------------------------------------------------------

## Checking Supported Architectures

After pushing the image, inspect the manifest:

    docker buildx imagetools inspect username/myapp:latest

This shows all architectures included in the image.

------------------------------------------------------------------------

## Key Takeaways

-   Docker images are architecture-specific by default.
-   Docker Buildx enables building images for multiple architectures.
-   Multi-arch images ensure compatibility across ARM and x86 systems.
-   Docker automatically pulls the correct architecture for the host
    machine.

------------------------------------------------------------------------

## Real-World Usage

Multi-architecture builds are used by:

-   Kubernetes deployments
-   Cloud-native applications
-   Open-source projects supporting ARM devices
-   CI/CD pipelines targeting multiple platforms
