# Docker Logging Driver: fluentd

## Overview

In production environments, container logs are rarely stored locally on
the Docker host. Instead, logs are usually sent to **centralized logging
systems**.

One common way to achieve this is by using the **Fluentd logging
driver**.

Fluentd is a popular open-source log collector that can aggregate logs
and forward them to systems such as:

-   Elasticsearch
-   Loki
-   Splunk
-   Datadog
-   Kafka

This example demonstrates how Docker can send container logs directly to
**Fluentd** using the `fluentd` logging driver.

------------------------------------------------------------------------

## Project Structure

    logging-driver-fluentd/
    │
    ├── app.py
    ├── Dockerfile
    ├── run.sh
    ├── clean.sh
    └── README.md

------------------------------------------------------------------------

## Application Behavior

The Python application continuously generates logs.

Example output:

    Log line 1 - sending logs to fluentd
    Log line 2 - sending logs to fluentd
    Log line 3 - sending logs to fluentd

Instead of being stored locally by Docker, these logs will be
**forwarded to Fluentd**.

------------------------------------------------------------------------

## Docker Logging Configuration

The container is started with the following logging driver:

    --log-driver fluentd

Docker will forward all logs to a Fluentd collector.

Example configuration used in this example:

    --log-driver fluentd
    --log-opt fluentd-address=localhost:24224

This tells Docker to send logs to a Fluentd instance running on port
**24224**.

------------------------------------------------------------------------

## Running the Example

Run:

    ./run.sh

The script performs the following steps:

1.  Builds the Docker image
2.  Runs the container in **detached mode**
3.  Configures the container to use the **Fluentd logging driver**
4.  Shows running containers
5.  Displays logging configuration

Docker run command used:

    docker run -d \
      --name logging-driver-fluentd \
      --log-driver fluentd \
      --log-opt fluentd-address=localhost:24224 \
      logging-driver-fluentd

------------------------------------------------------------------------

## Important Note

This example assumes that a **Fluentd server is running** on:

    localhost:24224

If Fluentd is not running, Docker will show an error similar to:

    failed to initialize logging driver: dial tcp 127.0.0.1:24224: connect: connection refused

This is expected and helps demonstrate that Docker tries to send logs
externally.

------------------------------------------------------------------------

## Inspecting Logging Configuration

To verify the logging driver:

    docker inspect logging-driver-fluentd --format='{{json .HostConfig.LogConfig}}'

Example output:

    {"Type":"fluentd","Config":{"fluentd-address":"localhost:24224"}}

------------------------------------------------------------------------

## Production Use Case

In real production environments, Fluentd acts as a **log collector**.

Typical architecture:

    Containers
         │
         ▼
    Docker Fluentd Logging Driver
         │
         ▼
    Fluentd Collector
         │
         ▼
    Central Logging System

This allows organizations to:

-   Aggregate logs from many containers
-   Search logs centrally
-   Monitor systems in real time

------------------------------------------------------------------------

## Cleanup

Run:

    ./clean.sh

This removes:

-   The container
-   The image

------------------------------------------------------------------------

## Key Takeaways

-   Docker can forward logs to external systems.
-   Fluentd is a widely used log collector.
-   The `fluentd` logging driver allows Docker to integrate with
    centralized logging pipelines.
-   This approach is common in large-scale containerized environments.
