# Docker Multi-Stage Build

## Overview

Multi-stage builds are a powerful Docker feature that allows you to use
multiple build stages within a single Dockerfile.

The main goal is to **reduce final image size** by including only the
necessary artifacts in the production image while excluding build tools
and intermediate files.

This technique is widely used in production environments and CI/CD
pipelines.

------------------------------------------------------------------------

## Why Multi-Stage Builds Matter

Without multi-stage builds:

-   Build tools remain inside the final image
-   Images become unnecessarily large
-   Security surface increases
-   Deployment becomes slower

With multi-stage builds:

-   Only compiled artifacts are copied to the final image
-   Build dependencies are discarded
-   Final images are significantly smaller and more secure

------------------------------------------------------------------------

## Project Structure

    multi-stage-build/
    │
    ├── app.py
    ├── requirements.txt
    ├── Dockerfile
    ├── run.sh
    ├── clean.sh
    └── README.md

------------------------------------------------------------------------

## Concept

The Dockerfile contains two stages:

### Stage 1 --- Builder Stage

This stage:

-   Installs dependencies
-   Builds or prepares the application

This stage is **temporary** and does not become the final image.

Example:

    FROM python:3.11-slim AS builder

------------------------------------------------------------------------

### Stage 2 --- Production Stage

This stage:

-   Starts from a clean image
-   Copies only required artifacts from the builder stage

Example:

    FROM python:3.11-slim
    COPY --from=builder /app /app

------------------------------------------------------------------------

## Dockerfile Flow

1.  Build dependencies and prepare the application in the builder stage
2.  Start a fresh image
3.  Copy only required files from the builder stage
4.  Run the application

This prevents development tools and unnecessary files from ending up in
the final image.

------------------------------------------------------------------------

## Running the Example

Run:

    ./run.sh

This script will:

1.  Build the Docker image using a multi-stage Dockerfile
2.  Start a container
3.  Display running containers

------------------------------------------------------------------------

## Expected Result

When the container runs, the application prints:

    Application running from a multi-stage build!

------------------------------------------------------------------------

## Checking Image Size

You can compare image sizes using:

    docker images

You will notice that multi-stage images are significantly smaller than
traditional builds.

------------------------------------------------------------------------

## Key Takeaways

-   Multi-stage builds separate build and runtime environments.
-   Builder stages allow heavy dependencies without affecting the final
    image.
-   The final image only contains what is necessary to run the
    application.
-   This results in smaller, faster, and more secure Docker images.

------------------------------------------------------------------------

## Real-World Example

Common use cases include:

-   Compiling Go binaries
-   Building Node.js applications
-   Compiling Java applications
-   Packaging Python applications

Example pattern:

    FROM node:20 AS builder
    RUN npm install
    RUN npm run build

    FROM nginx:alpine
    COPY --from=builder /app/dist /usr/share/nginx/html

------------------------------------------------------------------------

## Key Benefit

Multi-stage builds help reduce image sizes from:

    ~1GB → ~100MB

which leads to:

-   Faster deployments
-   Reduced bandwidth usage
-   Improved security
