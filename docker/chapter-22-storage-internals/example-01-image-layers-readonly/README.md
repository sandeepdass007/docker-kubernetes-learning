
# Chapter 22 — Example 01: Image Layers Are Read-Only

## Goal of This Example

This example demonstrates one of the most important internal concepts of Docker:

**Docker Images are made of read-only layers, and containers add a writable layer on top.**

This is the reason:
- Containers start fast
- Images are reusable
- Build cache works
- Multiple containers can share the same image layers

This example is designed to VISUALLY show image layers and Docker storage behavior.

---

## Folder Structure

image-layers-readonly/
│
├── Dockerfile
├── run.sh
├── clean.sh
└── README.md

---

## Dockerfile Explanation

Each `RUN` instruction in a Dockerfile creates a **new image layer**.

In this example:

    RUN apt-get update
    RUN apt-get install -y curl
    RUN apt-get install -y vim
    RUN echo "Layer test file" > /layer-test.txt

Each of these commands creates a separate layer.

So the final image is a **stack of layers**, not a single filesystem.

---

## What run.sh Does

The script performs the following steps:

1. Build Docker image
2. Show image layers using `docker history`
3. Run a container
4. Inspect Docker storage driver (overlay2)
5. Show Docker disk usage
6. Enter the container

This allows you to see how Docker layers actually work internally.

---

## Important Commands Used

### Show Image Layers
    docker history layer-demo

This shows all layers that make up the image.

### Inspect Container Storage
    docker inspect layer-demo-container | grep -i overlay -A 5

This shows where Docker stores the container layers on disk.

### Show Docker Disk Usage
    docker system df

This shows:
- Image size
- Container size
- Shared layer size

---

## Docker Storage Architecture (Very Important)

Docker uses a **Union File System** (overlay2).

The container filesystem looks like this:

    Container Writable Layer   ← Top (container writes here)
    -------------------------
    Image Layer 4
    Image Layer 3
    Image Layer 2
    Image Layer 1
    Base Image (Ubuntu)

Image layers are **READ-ONLY**.
Only the container writable layer can be modified.

---

## Real-World Implications

| Action | What Actually Happens |
|-------|----------------------|
| Modify file in container | Written to writable layer |
| Delete file in container | Hidden, not removed from image |
| Multiple containers | Share same image layers |
| Image rebuild | Only changed layers rebuilt |
| Container removed | Writable layer deleted |

This is why Docker is efficient and fast.

---

## Key Learning

- Docker images are made of layers
- Layers are read-only
- Containers add a writable layer
- Docker uses overlay2 (Union FS)
- Layers are cached and reused

If you understand this, you understand **how Docker actually works internally**.
