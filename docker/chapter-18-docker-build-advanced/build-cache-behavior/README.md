# Docker Build Cache Behavior

## Overview

Docker builds images using **layers**. Each instruction in a Dockerfile
creates a new layer. To speed up builds, Docker **caches layers** and
reuses them when nothing has changed.

However, if a layer changes, **all layers after it must be rebuilt**.

This example demonstrates:

-   How Docker build cache works
-   How small changes invalidate later layers
-   Why Dockerfile instruction order matters for fast builds

------------------------------------------------------------------------

## Project Structure

    build-cache-behavior/
    │
    ├── app.py
    ├── config.txt
    ├── Dockerfile
    ├── run.sh
    ├── clean.sh
    └── README.md

------------------------------------------------------------------------

## How Docker Build Cache Works

Consider the following Dockerfile steps:

1.  Install dependencies
2.  Copy configuration
3.  Copy application code

If the application code changes, Docker should **only rebuild the last
layer**.

But if configuration is copied before dependencies, changing config may
trigger unnecessary rebuilds.

------------------------------------------------------------------------

## Example Behavior

The Dockerfile copies two files:

    config.txt
    app.py

The build output will show something like:

    Step 3/5 : COPY config.txt .
     ---> Using cache
    Step 4/5 : COPY app.py .
     ---> Using cache

If `app.py` changes:

    Step 3/5 : COPY config.txt .
     ---> Using cache
    Step 4/5 : COPY app.py .
     ---> Running

Only the last layer rebuilds.

------------------------------------------------------------------------

## Running the Example

Run:

    ./run.sh

The script performs:

1.  Initial Docker build
2.  Second build showing cached layers
3.  Modify `app.py`
4.  Build again to demonstrate cache invalidation
5.  Start the container

------------------------------------------------------------------------

## What You Should Observe

### First Build

All layers are built.

### Second Build

All layers use cache:

    Using cache

### After Changing app.py

Only the final layer rebuilds.

This demonstrates how Docker determines when cache can be reused.

------------------------------------------------------------------------

## Why This Matters

Correct Dockerfile design can significantly speed up builds.

Bad ordering can cause:

-   Slow CI pipelines
-   Reinstalling dependencies unnecessarily
-   Large rebuild times

Best practice is to copy **stable files first** and **frequently
changing files later**.

------------------------------------------------------------------------

## Cleaning Up

Run:

    ./clean.sh

This removes the container and image.

------------------------------------------------------------------------

## Key Takeaways

-   Docker builds images layer by layer.
-   Layers are cached for faster builds.
-   Changing a layer invalidates all layers after it.
-   Proper Dockerfile ordering improves build performance.
