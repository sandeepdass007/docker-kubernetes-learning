
# Chapter 14 — Basic Health Check

## Goal

Demonstrate how Docker can monitor whether an application inside a container is actually healthy.

A container can be **running but the application inside might be broken**.  
Docker Health Checks allow Docker to periodically verify the application's health.

---

## Folder Structure

basic-healthcheck/
    app.py
    Dockerfile
    run.sh
    clean.sh
    README.md

---

## Application

The Flask app exposes two endpoints:

/           -> basic response  
/health     -> endpoint used by Docker health check

Docker will periodically call:

http://localhost:5001/health

If it returns HTTP 200 → container is healthy.

---

## Important Note

The base image `python:3.11-slim` does NOT include `curl`.

Since the healthcheck command uses curl, we must install it.

Example:

RUN apt-get update && apt-get install -y curl

Without this step Docker will mark the container **unhealthy** even though the app works.

---

## Dockerfile Explanation

HEALTHCHECK parameters:

--interval=10s  
Docker runs the health check every 10 seconds.

--timeout=3s  
If the command does not complete in 3 seconds, it fails.

--retries=3  
After 3 consecutive failures, container becomes unhealthy.

Healthcheck command:

curl -f http://localhost:5001/health || exit 1

`-f` makes curl fail if HTTP code is not 200.

---

## Running the Example

chmod +x run.sh clean.sh
./run.sh

The container runs in detached mode.

---

## Check Health Status

docker ps

Example output:

STATUS
Up 20 seconds (healthy)

---

## Inspect Detailed Health Info

docker inspect health-basic

Look for:

"Health": {
  "Status": "healthy"
}

---

## Cleaning Up

./clean.sh

This will:

1. Stop container
2. Remove container
3. Remove Docker image
