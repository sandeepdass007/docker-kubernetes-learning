
# Chapter 21 — Example 05: Private Registry Authentication Failure (ImagePullBackOff Simulation)

## What This Example Demonstrates

This example simulates a very common production issue:

Kubernetes fails to pull an image from a private registry and shows:
    ImagePullBackOff

We will simulate the same behavior using Docker by:
1. Pushing an image to Docker Hub (private repository)
2. Logging out from Docker
3. Trying to pull the private image
4. Pull fails due to authentication error
5. Then logging in and pulling successfully

This is exactly what happens in Kubernetes when imagePullSecrets are missing.

---

## Folder Structure

private-registry-auth-failure/
    app.py
    Dockerfile
    run.sh
    clean.sh
    README.md

---

## What Happens in This Demo

Step 1 — Build image  
Step 2 — Push to Docker Hub (Private Repo)  
Step 3 — Logout from Docker  
Step 4 — Try to pull image → FAIL  
Step 5 — Login again  
Step 6 — Pull image → SUCCESS  
Step 7 — Run container  

This simulates Kubernetes ImagePullBackOff scenario.

---

## Expected Error (Important)

When logged out and trying to pull private image:

    pull access denied for <repo>, repository does not exist or may require 'docker login'

This is equivalent to:

    ImagePullBackOff (Kubernetes)

---

## Real Kubernetes Fix

Create secret:

    kubectl create secret docker-registry regcred       --docker-username=<username>       --docker-password=<password>

Use in deployment:

    imagePullSecrets:
      - name: regcred

---

## Real Production Lesson

| Problem | Cause | Fix |
|--------|------|-----|
| ImagePullBackOff | Private image | imagePullSecrets |
| ErrImagePull | Wrong tag | Fix tag |
| access denied | Not logged in | Docker login |
| manifest not found | Wrong version | Use correct tag |

---

## Summary

This example teaches:
- Private vs Public registry
- Authentication failure
- Why Kubernetes needs imagePullSecrets
- Real production deployment issue
