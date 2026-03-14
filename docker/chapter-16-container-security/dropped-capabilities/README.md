# Docker Security Example --- Dropping Linux Capabilities

## Why this matters

Containers run on the Linux kernel and inherit a set of **Linux
capabilities** by default.

Capabilities are permissions that allow processes to perform privileged
operations such as:

-   changing network interfaces
-   mounting filesystems
-   modifying kernel settings
-   binding to low ports

Even non-root containers may still have some capabilities.

Production systems often **remove unnecessary capabilities** to reduce
the attack surface.

Example Docker runtime flags:

    --cap-drop ALL
    --cap-add NET_BIND_SERVICE

This means:

-   remove every capability
-   only allow the container to bind to network ports

This principle is called **Least Privilege**.

------------------------------------------------------------------------

## What this example demonstrates

This container attempts an operation that requires elevated privileges.

We run the container with **all capabilities dropped**, which prevents
the action from succeeding.

This demonstrates how hardened containers restrict what processes can do
inside them.

------------------------------------------------------------------------

## Folder Structure

    dropped-capabilities/
       app.py
       Dockerfile
       run.sh
       clean.sh
       README.md

------------------------------------------------------------------------

## Application Behavior

The application will:

1.  Print startup information
2.  Attempt a restricted operation
3.  Show the result in logs
4.  Continue running for inspection

------------------------------------------------------------------------

## Running the Example

Make scripts executable:

    chmod +x run.sh
    chmod +x clean.sh

Run the container:

    ./run.sh

Check logs:

    docker logs dropped-capabilities

------------------------------------------------------------------------

## Inspecting Capabilities

You can inspect the container configuration:

    docker inspect dropped-capabilities

Look for:

    CapDrop

You should see:

    ALL

------------------------------------------------------------------------

## Cleanup

    ./clean.sh

------------------------------------------------------------------------

## Production Insight

Dropping capabilities is a powerful hardening technique.

A common production pattern:

-   drop all capabilities
-   add back only what is necessary

Example:

    --cap-drop ALL
    --cap-add NET_BIND_SERVICE

This ensures the container runs with **minimum privileges**.

------------------------------------------------------------------------

## Kubernetes Equivalent

In Kubernetes:

    securityContext:
      capabilities:
        drop:
          - ALL

Capabilities can then be selectively added.
