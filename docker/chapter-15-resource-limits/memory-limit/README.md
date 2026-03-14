
# Chapter 15 – Memory Resource Limits

## Goal

Demonstrate how Docker can **limit the memory usage of a container**.

If a container tries to consume more memory than the configured limit,
Docker will terminate the container. This is commonly referred to as an **OOM (Out Of Memory) kill**.

This example intentionally simulates a **memory leak** so we can observe Docker enforcing the memory limit.

---

## Folder Structure

chapter-15-resource-limits/
    memory-limit/
        app.py
        Dockerfile
        run.sh
        clean.sh
        README.md

---

## Application Behavior

The application continuously allocates memory in a loop.

Over time the memory usage keeps increasing until it exceeds the Docker memory limit.

When the limit is exceeded:

Docker kills the container.

---

## Memory Limit Used

The container is started with:

--memory="100m"

Meaning:

The container **cannot use more than 100 MB of RAM**.

Once the application exceeds this limit, Docker stops the container automatically.

---

## Application Code Behavior

The Python program repeatedly appends data into a list.

Each iteration increases memory usage.

Eventually the memory consumption crosses the allowed limit.

---

## Running the Example

Make scripts executable:

chmod +x run.sh clean.sh

Start the demo:

./run.sh

The script will:

1. Build the Docker image
2. Run the container with a memory limit
3. Wait a few seconds
4. Display running containers

---

## Monitor Memory Usage

Run:

docker stats

You will see memory usage increasing until the container is killed.

Example output:

CONTAINER NAME    CPU %    MEM USAGE
memory-limit-demo  5%      90MB / 100MB

Shortly after reaching the limit, the container stops.

---

## Confirm the OOM Kill

Run:

docker ps -a

You may see something like:

Exited (137)

Exit code **137** usually indicates the container was killed due to memory limits.

---

## Cleanup

Run:

./clean.sh

The cleanup script will:

1. Stop the container (if running)
2. Remove the container
3. Remove the image

---

## Key Concept

Docker uses **Linux cgroups** to enforce memory limits.

If a container exceeds its allowed memory:

The kernel's **OOM killer** terminates the container.

---

## Real World Impact

Memory limits prevent situations where:

- one service consumes all system memory
- the host machine becomes unstable
- other containers crash due to lack of RAM

This is critical in environments such as:

- Kubernetes clusters
- container hosting platforms
- shared development servers

In Kubernetes this maps directly to:

resources:
  limits:
    memory: "100Mi"
