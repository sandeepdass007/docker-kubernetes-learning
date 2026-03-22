
# Chapter 21 — Example 04: The `latest` Tag Production Problem

## What This Example Demonstrates

This example demonstrates one of the most common and dangerous mistakes in production:
Using the `latest` tag for Docker images.

We will simulate a real production issue where:
1. Version 1 of the app is pushed as `latest`
2. A container is started from `latest`
3. Version 2 of the app is pushed as `latest`
4. The running container STILL runs Version 1

This shows why `latest` is dangerous and should not be used in production.

---

## Folder Structure

latest-tag-problem/
    app.py
    Dockerfile
    run.sh
    clean.sh
    README.md

---

## app.py (Version 1)

Initially, the app will print:
    App Version: V1

Later, you will modify it to:
    App Version: V2

This simulates a new production release.

---

## Step-by-Step Execution

### Step 1 — Build and Push Version 1 as latest
The script will:
- Build the Docker image
- Tag it as latest
- Push to Docker Hub
- Run a container

Open:
http://localhost:5007

You should see:
    App Version: V1

---

### Step 2 — Modify the App
Change app.py from:
    App Version: V1
to:
    App Version: V2

Then run run.sh again.

This pushes a NEW image with the SAME tag `latest`.

---

### Step 3 — Check Running Container

Now check logs:
    docker logs latest-tag-demo

You will still see:
    App Version: V1

Why?
Because containers do NOT auto-update when the image tag changes.

This is a major production issue.

---

## Real Production Problem

In Kubernetes:

If you use:
    image: myapp:latest

Kubernetes may:
- Use cached image
- Not pull new image
- Run old code in production

This leads to:
- New deployment but old code running
- Very hard-to-debug production incidents

---

## Correct Production Strategy

Never use `latest`.

Use versioned tags:
    myapp:v1
    myapp:v2
    myapp:v3

In Kubernetes:
    image: myapp:v3

This guarantees correct deployment.

---

## Key Learning

| Tag | Behavior |
|-----|----------|
| latest | Moves every push |
| v1 | Fixed version |
| v2 | Fixed version |
| latest running container | Does NOT update |

---

## Commands to Verify

List images:
    docker images

List containers:
    docker ps

Check container image:
    docker inspect latest-tag-demo | grep Image

---

## Summary

This example demonstrates:
- Why `latest` is dangerous
- How image tags work
- Why versioned tagging is required in production
- Real-world Kubernetes deployment issue
