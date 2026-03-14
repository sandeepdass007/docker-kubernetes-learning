# Docker Security Example --- Read Only Filesystem

## Why this matters

In production environments, containers should be **as immutable as
possible**.

One powerful security practice is running containers with a **read-only
root filesystem**.

This prevents: - attackers from modifying application files - malware
from writing payloads - accidental file modifications - persistence
inside containers

Even if an attacker gains access, they **cannot modify the container
filesystem**.

This is commonly enforced in: - Kubernetes
(`readOnlyRootFilesystem: true`) - Hardened Docker deployments -
Security‑focused container platforms

------------------------------------------------------------------------

## What this example demonstrates

This example intentionally shows a container trying to:

1.  Write to the root filesystem
2.  Fail due to the read‑only restriction

You will observe:

-   the application starts normally
-   writing to disk fails
-   the container logs show the error

This simulates a **security hardening scenario**.

------------------------------------------------------------------------

## Folder Structure

    read-only-filesystem/
       app.py
       Dockerfile
       run.sh
       clean.sh
       README.md

------------------------------------------------------------------------

## Application Behavior

The application will:

1.  Print startup information
2.  Attempt to write a file to `/app/output.txt`
3.  Fail due to the read‑only filesystem
4.  Continue running so the container can be inspected

------------------------------------------------------------------------

## Running the Example

Make scripts executable:

    chmod +x run.sh
    chmod +x clean.sh

Run the container:

    ./run.sh

Check logs:

    docker logs read-only-filesystem

Expected log output:

    Container started
    Attempting to write to filesystem...
    Write failed: Read-only file system

------------------------------------------------------------------------

## Inspect the Container

You can verify the filesystem mode:

    docker inspect read-only-filesystem

Or try writing manually:

    docker exec -it read-only-filesystem sh
    touch test.txt

This should fail with:

    Read-only file system

------------------------------------------------------------------------

## Cleanup

    ./clean.sh

------------------------------------------------------------------------

## Production Insight

Running containers with a read-only root filesystem greatly improves
security.

Typical pattern in production:

-   root filesystem → read-only
-   writable locations → mounted volumes (`/tmp`, `/logs`, `/data`)

This dramatically reduces the **attack surface**.

------------------------------------------------------------------------

## Real World Usage

In Kubernetes:

    securityContext:
      readOnlyRootFilesystem: true

Many regulated environments require this configuration for compliance.
