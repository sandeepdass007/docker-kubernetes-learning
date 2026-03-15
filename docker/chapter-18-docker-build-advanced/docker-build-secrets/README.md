# Docker Build Secrets

## Overview

When building Docker images, sometimes the build process requires
**sensitive information**, such as:

-   Private repository tokens
-   API keys
-   Private package registry credentials
-   SSH keys

Using normal Docker techniques like `ARG` or `ENV` to pass secrets is
**unsafe** because those values may be stored in image layers or visible
in image history.

Docker BuildKit introduces **Build Secrets**, which allow secrets to be
used **during the build process without being stored in the final
image**.

------------------------------------------------------------------------

## Why Build Secrets Matter

Without build secrets:

-   Secrets can leak into image layers
-   Secrets may appear in `docker history`
-   Anyone pulling the image might retrieve them

With BuildKit secrets:

-   Secrets are **mounted temporarily**
-   They exist **only during the specific RUN command**
-   They are **never stored in the final image**

------------------------------------------------------------------------

## Project Structure

    docker-build-secrets/
    │
    ├── app.py
    ├── Dockerfile
    ├── secret.txt
    ├── run.sh
    ├── clean.sh
    └── README.md

------------------------------------------------------------------------

## Important Requirement

Build secrets require **Docker BuildKit**.

Enable it with:

    export DOCKER_BUILDKIT=1

or

    DOCKER_BUILDKIT=1 docker build ...

------------------------------------------------------------------------

## Dockerfile Explanation

The Dockerfile uses the special syntax:

    RUN --mount=type=secret

Example:

    RUN --mount=type=secret,id=mysecret     cat /run/secrets/mysecret

During the build:

-   Docker mounts the secret temporarily at `/run/secrets/`
-   The command can read it
-   The secret disappears immediately after the command finishes

------------------------------------------------------------------------

## Running the Example

Run:

    ./run.sh

The script will:

1.  Enable BuildKit
2.  Pass the secret file to the Docker build
3.  Build the image
4.  Start the container

------------------------------------------------------------------------

## Passing the Secret

The secret is passed during build using:

    docker build   --secret id=mysecret,src=secret.txt   -t build-secret-demo .

Here:

-   `id=mysecret` is the identifier used in the Dockerfile
-   `src=secret.txt` is the local secret file

------------------------------------------------------------------------

## What Happens During Build

The Dockerfile reads the secret file during build but does **not copy it
into the image**.

Even if someone runs:

    docker history build-secret-demo

the secret will **not appear**.

------------------------------------------------------------------------

## Security Advantage

Build secrets prevent:

-   Secret leakage in image layers
-   Secret exposure in build logs
-   Secrets being included in the final container

This makes them ideal for:

-   Private dependency installation
-   Secure API access during builds
-   Accessing private Git repositories

------------------------------------------------------------------------

## Key Takeaways

-   Never use `ARG` or `ENV` for sensitive data during builds.
-   Use **Docker BuildKit secrets** instead.
-   Secrets are mounted temporarily and never stored in the image.
-   This approach significantly improves container security.
