# Chapter 11 — Bad Example: Single-Stage Docker Build (Python)

## What is this example?

This example demonstrates a single-stage Docker build where:

- Dependency installation
- Application code
- Runtime execution

all happen in one image.

This pattern is extremely common for beginners and works, but it hides
important problems that become painful at scale.

---

## The Dockerfile (What We Are Doing)

The Dockerfile:

- Starts from a Python base image
- Installs dependencies using pip
- Copies application code
- Runs the app

Everything happens in one place.

---

## What Problem Exists Here?

Nothing is technically broken.

The application runs correctly.

However, the final image contains more than what is required at runtime.

Specifically, the image includes:
- pip and its metadata
- build-time artifacts
- dependency installation history
- tools that are never needed once the app is running

---

## Why This Is a Problem

Docker images are runtime artifacts, not development environments.

Shipping build tools inside runtime images leads to:
- Larger image sizes
- Slower image pulls
- Larger attack surface
- Harder security audits
- Containers that can modify themselves

In real production systems, this violates a core principle:

Runtime systems should not contain build tools.

---

## What About Docker Cache?

Docker caching still works here, but poorly.

If you use:
COPY . .

then:
- Any change to any file invalidates the cache
- Dependencies are reinstalled unnecessarily
- Build time increases with project size

Docker is not slow — it is simply following instructions literally.

---

## Key Takeaway

This image:
- Works
- Is easy to write
- Is easy to understand

But it is not production-grade.

It mixes build-time concerns with runtime concerns, which is exactly
what multi-stage builds exist to solve.

Proceed to the good example to see how this is fixed cleanly.
