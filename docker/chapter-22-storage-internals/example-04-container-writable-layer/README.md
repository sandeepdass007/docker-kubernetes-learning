
# Chapter 22 — Example 04: Container Writable Layer Size

## Goal of This Example

This example demonstrates that when a container writes data, the data is stored in the **container writable layer**, not in the image.

This explains:
- Why container size increases over time
- Why logs fill disk
- Why /var/lib/docker grows
- Why containers should use volumes for persistent data

---

## Folder Structure

container-writable-layer/
│
├── Dockerfile
├── run.sh
├── clean.sh
└── README.md

---

## Concept

Docker filesystem layers:

    Container Writable Layer  ← Changes go here
    -------------------------
    Image Layer 3
    Image Layer 2
    Image Layer 1
    Base Image

When a container writes files (logs, temp files, uploads), the container writable layer grows in size.

If the container is deleted, the data is lost.

---

## What run.sh Does

The script performs:

1. Build Docker image
2. Run container
3. Write a large file inside container (200MB)
4. Show container size increase
5. Show image size unchanged
6. Demonstrate difference between image size and container size

---

## Important Commands

### Show container size
    docker ps -s

This shows:
- Container size
- Virtual size (image + container)

### Show Docker disk usage
    docker system df

This shows disk usage by:
- Images
- Containers
- Volumes

---

## Expected Result

Before writing file:
    Container size → Small

After writing file:
    Container size → Large

Image size:
    Unchanged

This proves that data is stored in the container writable layer.

---

## Real-World Impact

| Scenario | What Happens |
|---------|--------------|
| Application logs | Fill container layer |
| Temp files | Increase container size |
| File uploads | Stored in container |
| Container deleted | Data lost |
| Use volumes | Data persists |

This is why in production:
- Logs go to volumes
- Uploads go to volumes
- Databases use volumes

---

## Key Learning

- Container writable layer stores runtime changes
- Container size increases when writing data
- Image size does not change
- Containers are ephemeral
- Use volumes for persistent data
