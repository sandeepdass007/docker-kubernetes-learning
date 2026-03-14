# Chapter 14 -- Failing Health Check

## Goal

Demonstrate how Docker detects when an application **becomes unhealthy
after starting successfully**.

This example simulates a real production issue:

1.  Container starts normally
2.  Health endpoint works
3.  After 30 seconds the application intentionally fails
4.  Docker health check begins failing
5.  Docker marks container **unhealthy**

This shows that **running ≠ healthy**.

------------------------------------------------------------------------

## Folder Structure

    failing-healthcheck/
        app.py
        Dockerfile
        run.sh
        clean.sh
        README.md

------------------------------------------------------------------------

## Application Behaviour

The application exposes:

    /        -> normal endpoint
    /health  -> health check endpoint

For the first **30 seconds**:

    /health -> returns HTTP 200

After 30 seconds:

    /health -> returns HTTP 500

Docker will detect this and mark the container **unhealthy**.

------------------------------------------------------------------------

## Dockerfile Healthcheck

Docker runs the following command periodically:

    curl -f http://localhost:5002/health || exit 1

Options used:

    --interval=10s
    --timeout=3s
    --retries=3

Meaning:

  Option     Meaning
  ---------- ----------------------------------------------
  interval   run health check every 10 seconds
  timeout    command must complete within 3 seconds
  retries    after 3 failures container becomes unhealthy

------------------------------------------------------------------------

## Running the Example

Make scripts executable:

    chmod +x run.sh clean.sh

Start the demo:

    ./run.sh

The script:

1.  Builds the image
2.  Runs container in **detached mode**
3.  Waits for 15 seconds
4.  Shows container status

------------------------------------------------------------------------

## Observe Health Status

Run:

    docker ps

Initially you will see:

    Up 20 seconds (healthy)

After \~30‑40 seconds:

    Up 1 minute (unhealthy)

Docker detected the failure.

------------------------------------------------------------------------

## Inspect Health Details

    docker inspect health-failing

Look for:

    "Health": {
      "Status": "unhealthy"
    }

You will also see the history of health check attempts.

------------------------------------------------------------------------

## View Logs

    docker logs -f health-failing

------------------------------------------------------------------------

## Cleanup

Run:

    ./clean.sh

The cleanup script:

1.  Stops container
2.  Removes container
3.  Removes image

------------------------------------------------------------------------

## Why This Matters

Containers can remain **running even if the application inside is
broken**.

Health checks allow platforms like:

-   Docker Swarm
-   Kubernetes
-   ECS

to detect failures and take action.

In Kubernetes this maps directly to:

    Docker HEALTHCHECK
            ↓
    Kubernetes Liveness Probe
    Kubernetes Readiness Probe
