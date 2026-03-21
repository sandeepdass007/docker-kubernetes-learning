
# Chapter 22 — Example 02: Copy-on-Write (Why Containers Are Fast)

## Goal of This Example

This example demonstrates Docker's **Copy-on-Write** mechanism.

Copy-on-Write means:
When a container modifies a file from the image layer, Docker does NOT modify the original image file.
Instead, Docker copies the file to the container writable layer and modifies it there.

This is why:
- Containers start fast
- Multiple containers can share the same image
- Storage is efficient

---

## Folder Structure

copy-on-write-demo/
│
├── Dockerfile
├── run.sh
├── clean.sh
└── README.md

---

## Dockerfile Explanation

The Dockerfile creates a file inside the image:

    /data/file.txt

This file is part of the **image layer (read-only)**.

When the container modifies this file, Docker will:
- Copy the file to container writable layer
- Modify the copied file
- Original image file remains unchanged

This is Copy-on-Write.

---

## What run.sh Does

The script performs:

1. Build Docker image
2. Run Container 1
3. Show original file content
4. Modify file inside Container 1
5. Show modified content
6. Run Container 2 from same image
7. Show file content in Container 2 (still original)

This proves:
**Each container gets its own writable layer.**

---

## Expected Output

Container 1:
    Original Data
    Modified by Container 1

Container 2:
    Original Data

This proves containers do NOT modify the image.
They only modify their own writable layer.

---

## Important Concept

Image Layers → Read Only  
Container Layer → Writable  

When file modified:
Docker performs Copy-on-Write.

---

## Real-World Impact

| Scenario | What Happens |
|---------|--------------|
| App writes logs | Stored in container layer |
| App modifies config | Stored in container layer |
| Container deleted | Changes lost |
| New container | Starts from original image |

This is why containers are **ephemeral**.

---

## Key Learning

- Copy-on-Write is core Docker storage behavior
- Containers do not change images
- Each container has its own writable layer
- Deleting container deletes writable layer
