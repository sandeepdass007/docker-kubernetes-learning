# Chapter 20 --- Docker Debugging Tools

## Overview

This chapter focuses on **real-world debugging techniques** for Docker
containers.

Running containers is easy --- debugging them in production is where
real skills are required.

You will learn how to inspect, monitor, and troubleshoot containers
using essential Docker commands.

------------------------------------------------------------------------

## Project Structure

chapter-20-docker-debugging-tools/ │ ├── debug-container/ │ ├──
Dockerfile │ └── app.py │ ├── run.sh ├── monitor.sh ├── clean.sh └──
README.md

------------------------------------------------------------------------

## Application Behavior

The container runs a simple Python app that:

-   Prints heartbeat logs continuously
-   Displays its process ID
-   Runs indefinitely

Example output:

Starting debug container... Heartbeat 0 PID: 1 Heartbeat 1

------------------------------------------------------------------------

## Important Fix (Logging)

Python buffers output by default inside containers.

To ensure logs appear in docker logs, we use:

CMD \["python", "-u", "app.py"\]

or:

ENV PYTHONUNBUFFERED=1

Without this, logs may not appear in real time.

------------------------------------------------------------------------

## Running the Example

Start container:

./run.sh

Monitor container:

./monitor.sh

------------------------------------------------------------------------

## Debugging Tools Demonstrated

1.  Docker Logs\
    docker logs -f debug-demo

Used to view container output in real time.

------------------------------------------------------------------------

2.  Docker Inspect\
    docker inspect debug-demo

Shows container configuration, environment variables, networking,
mounts, and runtime settings.

------------------------------------------------------------------------

3.  Docker Stats\
    docker stats --no-stream

Displays CPU usage, memory usage, and network I/O.

------------------------------------------------------------------------

4.  Docker Top\
    docker top debug-demo

Shows running processes inside the container.

------------------------------------------------------------------------

5.  Docker Exec\
    docker exec -it debug-demo sh

Allows you to enter the container and debug manually.

------------------------------------------------------------------------

6.  Docker Events\
    docker events

Streams real-time Docker activity such as container start/stop and
crashes.

------------------------------------------------------------------------

## Real-World Debugging Workflow

Typical production debugging flow:

1.  Check logs\
2.  Inspect container configuration\
3.  Monitor resource usage\
4.  Check running processes\
5.  Exec into container if needed

------------------------------------------------------------------------

## Key Takeaways

-   Docker debugging relies on a small set of powerful commands\
-   Logs must be properly configured (stdout/stderr)\
-   docker inspect is the most detailed debugging tool\
-   Resource monitoring helps identify performance issues\
-   Process inspection helps detect misbehaving applications

------------------------------------------------------------------------

## Common Mistakes

-   Not enabling unbuffered logs\
-   Writing logs to files instead of stdout\
-   Ignoring container resource usage\
-   Not checking process tree

------------------------------------------------------------------------

## Next Chapter

Chapter 21 --- Image Registries

You will learn:

-   Docker Hub and private registries\
-   Image tagging strategies\
-   Authentication\
-   Pushing and pulling images\
-   Secure image distribution
