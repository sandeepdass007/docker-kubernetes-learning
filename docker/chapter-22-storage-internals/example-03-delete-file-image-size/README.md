
# Chapter 22 — Example 03: Deleting Files Does NOT Reduce Image Size

## Goal of This Example

This example demonstrates a very common Docker mistake:

**Deleting files in a later Docker layer does NOT reduce the final image size.**

Why?
Because Docker images are built using layers, and each layer is immutable (read-only).
If you create a large file in one layer and delete it in another layer, the file still exists in the previous layer.

This example will prove that behavior.

---

## Folder Structure

delete-file-image-size/
│
├── Dockerfile
├── run.sh
├── clean.sh
└── README.md

---

## Dockerfile Explanation

This Dockerfile does the following:

Step 1 — Create a large file (100MB)
Step 2 — Delete the large file

You might expect the final image to be small, but it will still be large because the large file exists in a previous layer.

---

## What run.sh Does

The script performs:

1. Build Docker image
2. Show image size
3. Show Docker image layers
4. Run container
5. Show that the file does NOT exist in the container
6. But image size is still large

This proves that deleting files in later layers does not reduce image size.

---

## Expected Result

Inside container:
    File does NOT exist

But image size:
    Still large (because file exists in image layer history)

---

## Correct Way to Reduce Image Size

Instead of:

    RUN create large file
    RUN delete large file

Use:

    RUN create large file && delete large file

This keeps everything in the SAME layer so the file never gets saved in an earlier layer.

This is a very important Docker optimization technique.

---

## Real-World Impact

| Mistake | Result |
|--------|--------|
| Install packages then delete cache in new RUN | Image still large |
| Download file then delete in new RUN | Image still large |
| Multiple RUN commands | More layers, larger image |
| Single RUN with cleanup | Smaller image |

---

## Key Learning

- Docker images are layer-based
- Layers are immutable
- Deleting files in a new layer does NOT remove them from previous layers
- Combine commands in a single RUN to reduce image size
