# Docker -- Hands-on Book

This book teaches Docker **from absolute basics to practical
understanding** using **runnable, self-documented examples**.

The focus is not on memorizing commands, but on understanding:
- What Docker is doing
- Why it behaves the way it does
- How real-world Docker workflows are designed

------------------------------------------------------------------------

## How to use this book

Each chapter is designed to be:
- **Self-contained**
- Runnable with a **single command**
- Explained primarily through **code comments**
- Safe to run multiple times

The recommended way to learn is:
1. Run the chapter
2. Read the comments inside the files
3. Re-run and experiment
4. Clean up using the provided script

------------------------------------------------------------------------

## Chapters

### Chapter 1 --- Hello World

**Focus:** First contact with Docker

You will learn:
- What a Docker image is
- What a Docker container is
- How `docker build` and `docker run` work
- The difference between host and container execution

Location:

    docker/chapter-01-hello-world

------------------------------------------------------------------------

### Chapter 2 --- Image Layers & Cache

**Focus:** Understanding how Docker builds images

You will learn:
- How Docker builds images layer by layer
- How Docker caching works
- Why changing a file invalidates specific layers
- Why Dockerfile instruction order matters

Location:

    docker/chapter-02-image-layers

------------------------------------------------------------------------

### Chapter 3 --- Dockerfile Best Practices

**Focus:** Designing Dockerfiles that scale with change

You will learn:
- Why Dockerfile instruction order matters
- How to avoid unnecessary dependency reinstalls
- The difference between a working Dockerfile and a good Dockerfile
- How Docker caching behaves with code vs data changes

Location:

    docker/chapter-03-dockerfile-best-practices

------------------------------------------------------------------------

## Design principles followed in this book

- **Code-first learning:** files explain themselves line by line
- **Minimal theory:** only what is needed to understand behavior
- **Automation with clarity:** scripts show exactly what is executed
- **Real-world relevance:** concepts used in production Dockerfiles

------------------------------------------------------------------------

## What's next

The next chapters will build on this foundation and introduce:
- Dockerfile optimization
- Multi-stage builds
- Volumes and persistence
- Networking fundamentals

These topics will follow the same structure and learning style.

------------------------------------------------------------------------

## Final note

Do not rush. Re-run chapters. Modify files. Break things intentionally.

That is how Docker truly becomes intuitive.
