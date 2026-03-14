
# Chapter 17 — Container Logging
## Example 2: Understanding Docker's json-file Logging Driver

This example explains **how Docker actually stores container logs on the host machine** using the default
`json-file` logging driver.

In the previous example you learned how to read logs using:

docker logs

But an important production question is:

**Where are these logs stored on the host machine?**

This example answers that.

---

# Learning Goals

After completing this example you will understand:

• What a Docker logging driver is  
• What the `json-file` logging driver does  
• Where Docker stores logs on the host  
• How container logs are structured internally  
• Why Kubernetes logging works the same way

---

# Project Structure

```
json-file-driver
│
├── app.py
├── Dockerfile
├── run.sh
└── clean.sh
```

---

# Step 1 — Application Code

Create:

```
app.py
```

```python
import time

counter = 1

while True:
    print(f"Processing order #{counter}")
    counter += 1
    time.sleep(1)
```

This simple application continuously prints logs to stdout.

---

# Step 2 — Dockerfile

Create:

```
Dockerfile
```

```dockerfile
FROM python:3.11-slim

WORKDIR /app

COPY app.py .

CMD ["python", "app.py"]
```

---

# Step 3 — Run Script

Create:

```
run.sh
```

```bash
#!/bin/bash

docker build -t docker-json-logging .

docker run -d --name json-log-demo docker-json-logging
```

Make executable:

```
chmod +x run.sh
```

Run the container:

```
./run.sh
```

---

# Step 4 — Verify Logging Driver

Check which logging driver the container is using.

Run:

```
docker inspect json-log-demo | grep LogConfig -A 5
```

You should see:

```
"LogConfig": {
  "Type": "json-file"
}
```

This confirms Docker is using the **json-file logging driver**.

---

# Step 5 — Find Container ID

Run:

```
docker ps
```

Example output:

```
CONTAINER ID   IMAGE                 NAME
8f3c2a9f12ab   docker-json-logging   json-log-demo
```

Copy the container ID.

---

# Step 6 — Locate Log Files on Host

Docker stores logs here:

```
/var/lib/docker/containers/<container-id>/
```

Example:

```
/var/lib/docker/containers/8f3c2a9f12ab/
```

Inside you will find:

```
8f3c2a9f12ab-json.log
```

---

# Step 7 — Inspect Raw Logs

Open the log file:

```
sudo cat /var/lib/docker/containers/<container-id>/<container-id>-json.log
```

Example output:

```
{"log":"Processing order #1\n","stream":"stdout","time":"2026-03-14T14:35:20.123456Z"}
{"log":"Processing order #2\n","stream":"stdout","time":"2026-03-14T14:35:21.123456Z"}
```

Each log entry contains:

```
log      -> actual message
stream   -> stdout or stderr
time     -> timestamp
```

---

# Why This Format Exists

Docker stores logs in JSON format so that:

• log collectors can parse them easily  
• timestamps are preserved  
• stdout and stderr can be separated  

---

# How docker logs Works

When you run:

```
docker logs json-log-demo
```

Docker simply reads the JSON log file and prints the `log` field.

---

# How Kubernetes Uses the Same System

Kubernetes relies on the **container runtime logs** exactly like Docker.

The architecture looks like this:

```
Application
     ↓
stdout / stderr
     ↓
Container runtime
     ↓
JSON log files on node
     ↓
Log collector (Fluentd / Promtail)
     ↓
Central logging (ELK / Loki / Datadog)
```

That is why **writing logs to stdout is the best practice for containers.**

---

# The Hidden Problem

If logs keep growing, these files become very large.

Example:

```
10 GB
20 GB
50 GB
```

Eventually this can:

• fill the disk  
• crash the server  
• stop containers from running

This is why **log rotation is critical**.

---

# Cleanup Script

Create:

```
clean.sh
```

```bash
#!/bin/bash

docker stop json-log-demo
docker rm json-log-demo
docker rmi docker-json-logging
```

Make executable:

```
chmod +x clean.sh
```

Run:

```
./clean.sh
```

---

# Key Takeaways

Docker captures container logs using **logging drivers**.

Default driver:

```
json-file
```

Logs are stored on the host machine as:

```
JSON structured files
```

These files are the source for:

• docker logs  
• Kubernetes log collectors  
• centralized logging systems

---

# Next Example

Next you will implement:

```
log rotation
```

This prevents logs from filling your disk in production environments.
