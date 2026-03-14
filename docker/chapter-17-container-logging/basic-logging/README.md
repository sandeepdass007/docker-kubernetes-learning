
# Chapter 17 — Container Logging
## Example 1: Basic Logging with Docker

This example demonstrates how container logging works in Docker using **stdout** and **stderr**.  
Understanding this concept is extremely important because **almost all container platforms (including Kubernetes) rely on stdout/stderr for logging**.

---

# Learning Goals

After completing this example you will understand:

• Why containers log to stdout instead of log files  
• How Docker captures container logs  
• How to inspect logs using Docker commands  
• How to stream logs in real time  

---

# Project Structure

```
basic-logging
│
├── app.py
├── Dockerfile
├── run.sh
└── clean.sh
```

---

# Step 1 — Application Code

Create a file named:

```
app.py
```

```python
import time
import sys

counter = 1

while True:
    print(f"[INFO] Processing job number: {counter}")
    
    if counter % 5 == 0:
        print(f"[ERROR] Something went wrong at job {counter}", file=sys.stderr)

    counter += 1
    time.sleep(2)
```

What this program does:

• Prints normal logs to **stdout**  
• Occasionally prints errors to **stderr**  
• Runs continuously like a real service

---

# Step 2 — Dockerfile

Create a file:

```
Dockerfile
```

```dockerfile
FROM python:3.11-slim

WORKDIR /app

COPY app.py .

CMD ["python", "app.py"]
```

This container:

• Runs a simple Python service  
• Continuously writes logs to stdout and stderr  

---

# Step 3 — Run Script

Create:

```
run.sh
```

```bash
#!/bin/bash

docker build -t docker-logging-basic .

docker run -d --name logging-demo docker-logging-basic
```

Make it executable:

```
chmod +x run.sh
```

Run the container:

```
./run.sh
```

---

# Step 4 — View Container Logs

List running containers:

```
docker ps
```

Check logs:

```
docker logs logging-demo
```

Example output:

```
[INFO] Processing job number: 1
[INFO] Processing job number: 2
[INFO] Processing job number: 3
[INFO] Processing job number: 4
[INFO] Processing job number: 5
[ERROR] Something went wrong at job 5
```

---

# Step 5 — Stream Logs in Real Time

Follow logs continuously:

```
docker logs -f logging-demo
```

This behaves like:

```
tail -f logfile
```

Stop streaming using:

```
CTRL + C
```

The container will continue running.

---

# Step 6 — View Last N Lines

```
docker logs --tail 5 logging-demo
```

Example:

```
[INFO] Processing job number: 10
[ERROR] Something went wrong at job 10
```

---

# Step 7 — Add Timestamps

```
docker logs -t logging-demo
```

Example:

```
2026-03-14T14:20:11.521Z [INFO] Processing job number: 1
```

---

# Why Containers Log to stdout

Traditional applications write logs to files:

```
/var/log/app.log
```

But containers are **ephemeral**. They can:

• stop  
• restart  
• move to another host

Instead containers log to:

```
stdout
stderr
```

Docker captures these logs and stores them using a **logging driver**.

---

# Where Docker Actually Stores Logs

On Linux hosts logs are stored here:

```
/var/lib/docker/containers/<container-id>/<container-id>-json.log
```

Docker's default logging driver is:

```
json-file
```

You will explore this in the **next example**.

---

# Why This Matters in Production

Container platforms rely on this logging pattern:

```
Application
     ↓
stdout / stderr
     ↓
Container runtime
     ↓
Log collector (Fluentd / Promtail)
     ↓
Central log storage (ELK / Loki)
```

Because of this architecture:

**Applications should never manage log files inside containers.**

---

# Cleanup Script

Create:

```
clean.sh
```

```bash
#!/bin/bash

docker stop logging-demo
docker rm logging-demo
docker rmi docker-logging-basic
```

Make executable:

```
chmod +x clean.sh
```

Run cleanup:

```
./clean.sh
```

---

# Key Takeaways

Containers should:

• Log to stdout and stderr  
• Avoid writing log files inside the container  
• Let the container runtime handle log storage

---

# Next Example

Next you will learn:

```
json-file logging driver
```

You will see:

• where Docker stores logs  
• log structure  
• how large logs grow on disk
