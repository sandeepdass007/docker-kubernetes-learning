# Docker Logging Driver: `local`

## Overview

By default, Docker uses the **json-file logging driver**. This stores
logs as JSON files on disk. While this works well for development, it
can become inefficient in production environments because:

-   JSON logs grow quickly
-   Disk usage increases rapidly
-   Log parsing becomes expensive

Docker provides another logging driver called **`local`**, which is
optimized for:

-   Better disk efficiency
-   Built-in log rotation
-   Faster log retrieval

This example demonstrates how to run a container using the **`local`
logging driver** and observe how Docker manages logs differently
compared to the default `json-file` driver.

------------------------------------------------------------------------

## Project Structure

    logging-driver-local/
    │
    ├── app.py
    ├── Dockerfile
    ├── run.sh
    ├── clean.sh
    └── README.md

------------------------------------------------------------------------

## Application Behavior

The example application continuously generates logs. This allows us to
observe:

-   How logs are stored by Docker
-   How Docker handles log rotation
-   How `docker logs` interacts with the `local` logging driver

The application prints log messages rapidly so that log files grow
quickly.

Example log output:

    Log line 1 - generating logs
    Log line 2 - generating logs
    Log line 3 - generating logs
    ...

------------------------------------------------------------------------

## Application Code (`app.py`)

The Python application continuously generates log output.

Key behavior:

-   Infinite loop
-   Rapid log generation
-   Designed to stress the logging system

------------------------------------------------------------------------

## Dockerfile

The Dockerfile builds a lightweight container image containing the
Python logging application.

Base image:

    python:3.11-slim

This keeps the container small while supporting Python execution.

------------------------------------------------------------------------

## Running the Example

Run the following script:

    ./run.sh

The script performs the following steps:

1.  Builds the Docker image
2.  Starts the container in **detached mode**
3.  Configures Docker to use the **local logging driver**
4.  Waits for logs to accumulate
5.  Shows running containers
6.  Streams container logs

Example command used internally:

    docker run -d   --name logging-driver-local   --log-driver local   logging-driver-local

------------------------------------------------------------------------

## Viewing Logs

The script automatically runs:

    docker logs -f logging-driver-local

This follows container logs in real time.

Even though the logging driver is `local`, Docker still provides logs
through the `docker logs` command.

------------------------------------------------------------------------

## Inspecting the Logging Driver

You can verify the logging driver with:

    docker inspect logging-driver-local --format='{{.HostConfig.LogConfig.Type}}'

Expected output:

    local

------------------------------------------------------------------------

## Why the `local` Driver is Useful

The `local` driver provides several improvements:

### Automatic Log Rotation

Unlike the default `json-file` driver, the `local` driver automatically
rotates logs.

### Better Disk Efficiency

Logs are stored in a compact binary format rather than large JSON files.

### Faster Performance

Log retrieval is faster when containers generate high volumes of logs.

------------------------------------------------------------------------

## Production Insight

In production environments, Docker logs are often forwarded to
centralized systems such as:

-   Elasticsearch
-   Loki
-   Fluentd
-   Splunk

However, the `local` driver is often recommended when:

-   Running standalone Docker hosts
-   Disk usage must be controlled
-   Large volumes of logs are generated

------------------------------------------------------------------------

## Cleaning Up

To remove the container and image:

    ./clean.sh

This script stops the container and removes both the container and image
to keep the environment clean.

------------------------------------------------------------------------

## Key Takeaways

-   Docker supports multiple logging drivers.
-   The default driver is `json-file`.
-   The `local` driver is more efficient for production workloads.
-   Logs can still be accessed using `docker logs`.
