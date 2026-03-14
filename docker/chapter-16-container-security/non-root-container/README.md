# Running Containers as Non‑Root Users

## Why this matters

By default, Docker containers run as the **root user**.\
This is dangerous in production because if the container is compromised,
the attacker gets root-level privileges inside the container.

Security best practice in production systems is:

-   Do **not run containers as root**
-   Create a **dedicated user**
-   Run the application using that user

This example demonstrates:

1.  A container that creates a file owned by a non‑root user
2.  Proof that the container is **not running as root**
3.  The difference between root containers and secure containers

------------------------------------------------------------------------

## What this example demonstrates

When the container runs it will:

1.  Start a simple Python application
2.  Print the current user
3.  Write a file inside the container

You will see that the process is running as:

    appuser

instead of:

    root

------------------------------------------------------------------------

## Folder Structure

    non-root-container/
       app.py
       Dockerfile
       run.sh
       clean.sh
       README.md

------------------------------------------------------------------------

## Step 1 --- Run the Example

    chmod +x run.sh
    ./run.sh

Expected output from logs:

    Running as user: appuser
    User ID: 1001
    File written successfully

Verify the container user:

    docker exec non-root-container whoami

Output:

    appuser

------------------------------------------------------------------------

## Step 2 --- Inspect the Container

Check container process:

    docker top non-root-container

You will see the process running under the non‑root user.

------------------------------------------------------------------------

## Step 3 --- Cleanup

    chmod +x clean.sh
    ./clean.sh

------------------------------------------------------------------------

## Key Production Insight

Running containers as root is one of the **most common security
mistakes** in Docker deployments.

Best practices:

-   Always create a dedicated user
-   Use `USER` in the Dockerfile
-   Avoid privileged containers
-   Avoid unnecessary capabilities

Many security scanners (Trivy, Snyk, Anchore) flag containers that run
as root.

------------------------------------------------------------------------

## Production Rule

If your container **does not require root**, it **must not run as
root**.
