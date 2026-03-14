# Chapter 17 --- Container Logging

## Example 3: Log Rotation in Docker

This example demonstrates **log rotation**, which is a critical
production feature that prevents container logs from filling up the host
machine's disk.

Without log rotation, Docker log files can grow indefinitely and
eventually consume all available storage.

------------------------------------------------------------------------

# Learning Goals

After completing this example you will understand:

• What log rotation is\
• Why unlimited logs are dangerous in production\
• How Docker rotates logs using `max-size` and `max-file`\
• How to verify that rotation is working

------------------------------------------------------------------------

# Project Structure

    log-rotation
    │
    ├── app.py
    ├── Dockerfile
    ├── run.sh
    └── clean.sh

------------------------------------------------------------------------

# Step 1 --- Application Code

Create:

    app.py

``` python
import time

counter = 1

while True:
    print(f"Log entry number: {counter}")
    counter += 1
    time.sleep(0.2)
```

This program produces logs rapidly so we can trigger log rotation
quickly.

------------------------------------------------------------------------

# Step 2 --- Dockerfile

Create:

    Dockerfile

``` dockerfile
FROM python:3.11-slim

WORKDIR /app

COPY app.py .

CMD ["python", "app.py"]
```

------------------------------------------------------------------------

# Step 3 --- Run Script with Log Rotation

Create:

    run.sh

``` bash
#!/bin/bash

docker build -t docker-log-rotation .

docker run -d --name log-rotation-demo --log-driver json-file --log-opt max-size=10k --log-opt max-file=3 docker-log-rotation
```

Make executable:

    chmod +x run.sh

Run:

    ./run.sh

------------------------------------------------------------------------

# Step 4 --- What These Options Mean

    --log-opt max-size=10k

Each log file can grow up to **10 KB**.

    --log-opt max-file=3

Docker will keep **only 3 log files**.

Example rotation:

    container-json.log
    container-json.log.1
    container-json.log.2

Older logs will be deleted automatically.

------------------------------------------------------------------------

# Step 5 --- Generate Logs

Wait about **30--60 seconds** so the container generates enough logs to
trigger rotation.

------------------------------------------------------------------------

# Step 6 --- Find Container ID

Run:

    docker ps

Example:

    CONTAINER ID   IMAGE                NAME
    ab12cd34ef56   docker-log-rotation  log-rotation-demo

------------------------------------------------------------------------

# Step 7 --- Inspect Log Directory

Navigate to Docker log storage:

    /var/lib/docker/containers/<container-id>/

Example:

    /var/lib/docker/containers/ab12cd34ef56/

You should see multiple files:

    ab12cd34ef56-json.log
    ab12cd34ef56-json.log.1
    ab12cd34ef56-json.log.2

This confirms **log rotation is working**.

------------------------------------------------------------------------

# Why Log Rotation Is Critical

Without rotation, logs grow forever.

Example real-world problem:

    Container logs → 50 GB
    Disk space → 100% full
    Docker fails to start containers
    Server crashes

Log rotation prevents this scenario.

------------------------------------------------------------------------

# Production Best Practice

Most production systems configure log rotation globally in:

    /etc/docker/daemon.json

Example configuration:

``` json
{
  "log-driver": "json-file",
  "log-opts": {
    "max-size": "10m",
    "max-file": "5"
  }
}
```

This ensures **all containers rotate logs automatically**.

------------------------------------------------------------------------

# Cleanup Script

Create:

    clean.sh

``` bash
#!/bin/bash

docker stop log-rotation-demo
docker rm log-rotation-demo
docker rmi docker-log-rotation
```

Make executable:

    chmod +x clean.sh

Run:

    ./clean.sh

------------------------------------------------------------------------

# Key Takeaways

Log rotation protects production systems from:

• disk exhaustion\
• container crashes\
• node instability

Important options:

    max-size
    max-file

These ensure logs remain manageable.

------------------------------------------------------------------------

# What You Learned in Chapter 17

You now understand the complete Docker logging workflow:

1.  Containers write logs to **stdout/stderr**
2.  Docker captures logs using **logging drivers**
3.  Logs are stored as **JSON files on the host**
4.  **Log rotation** prevents disk exhaustion

These same principles apply to **Kubernetes logging systems**.

------------------------------------------------------------------------

# Next Chapter

Next we move to:

    Chapter 18 — Docker Networking Deep Dive

You will build examples for:

• bridge networks\
• container-to-container communication\
• custom networks\
• DNS-based service discovery
