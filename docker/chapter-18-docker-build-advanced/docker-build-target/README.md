# Docker Build Target (Building Specific Stages)

## Overview

When using **multi-stage Docker builds**, Docker normally builds **all
stages** of the Dockerfile until the final stage.

However, Docker also allows you to build **only a specific stage** using
the `--target` option.

This is extremely useful for:

-   Debugging build stages
-   Running tests in intermediate stages
-   CI/CD pipelines
-   Faster development builds

------------------------------------------------------------------------

## Project Structure

    docker-build-target/
    │
    ├── app.py
    ├── Dockerfile
    ├── run.sh
    ├── clean.sh
    └── README.md

------------------------------------------------------------------------

## Dockerfile Stages

This example Dockerfile contains **two stages**:

### Stage 1 --- Builder

Used for:

-   Installing dependencies
-   Preparing the application
-   Running tests or build steps

Example:

    FROM python:3.11-slim AS builder

------------------------------------------------------------------------

### Stage 2 --- Production

Used for:

-   Running the final application
-   Keeping the image minimal

Example:

    FROM python:3.11-slim AS production

------------------------------------------------------------------------

## Why Use --target

Normally:

    docker build -t my-image .

Docker builds **all stages**.

But you can stop at a specific stage:

    docker build --target builder -t debug-image .

This builds **only the builder stage**.

------------------------------------------------------------------------

## Example Workflow

### Build the Builder Stage

    docker build --target builder -t builder-image .

Use this when:

-   debugging build issues
-   testing dependency installation
-   inspecting intermediate artifacts

------------------------------------------------------------------------

### Build the Final Production Image

    docker build -t production-image .

This builds the entire Dockerfile and produces the final optimized
image.

------------------------------------------------------------------------

## Running the Example

Run:

    ./run.sh

The script demonstrates:

1.  Building only the builder stage
2.  Building the full production image
3.  Running the container

------------------------------------------------------------------------

## Key Takeaways

-   Multi-stage builds can contain multiple named stages.
-   Docker can build **specific stages using `--target`**.
-   This is very useful for debugging and CI pipelines.
-   It allows faster builds during development.

------------------------------------------------------------------------

## Real-World Use Case

CI pipelines often use this pattern:

    Stage 1 → install dependencies
    Stage 2 → run tests
    Stage 3 → build artifacts
    Stage 4 → production runtime

Developers can build only the stage they need during development using:

    docker build --target test-stage

while the CI pipeline builds the full production image.
