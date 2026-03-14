
# Chapter 15 – CPU Resource Limits

## Goal

Demonstrate how Docker can **limit the CPU resources** used by a container.

Without limits, a container can potentially consume **all available CPU on the host machine**, affecting other containers and applications.

This example shows how to restrict a container so it can only use **a portion of the CPU**.

---

## Folder Structure

chapter-15-resource-limits/
    cpu-limit/
        app.py
        Dockerfile
        run.sh
        clean.sh
        README.md

---

## Application Behavior

The Python application performs a continuous **CPU‑intensive computation**.

This ensures the container always tries to use as much CPU as possible so that we can clearly observe the effect of CPU limits.

---

## CPU Limit Used

The container is started with:

--cpus="0.5"

Meaning:

The container can use **only 50% of one CPU core**.

Even if the application tries to consume more CPU, Docker will **throttle the container**.

---

## Running the Example

Make scripts executable:

chmod +x run.sh clean.sh

Start the container:

./run.sh

The script will:

1. Build the Docker image
2. Run the container with CPU limits
3. Wait a few seconds
4. Display running containers

---

## Monitor CPU Usage

Run:

docker stats

You should see CPU usage hovering around **50%**, which corresponds to the configured limit.

Example:

CONTAINER NAME    CPU %     MEM USAGE
cpu-limit-demo    ~50%      ~30MB

---

## Why CPU Limits Matter

Without CPU limits:

- one container could consume all CPU
- other containers may become slow
- the host machine may become unstable

CPU limits ensure **fair resource allocation** across containers.

This becomes critical in environments running many services such as:

- Kubernetes clusters
- Docker Swarm deployments
- CI/CD infrastructure
- shared development servers

---

## Cleanup

Run:

./clean.sh

The cleanup script will:

1. Stop the container
2. Remove the container
3. Remove the image

---

## Key Concept

Docker enforces CPU limits using **Linux cgroups**.

Cgroups control how much CPU time a process is allowed to consume.

In orchestration platforms like Kubernetes, this concept maps directly to:

resources:
  limits:
    cpu: "500m"
