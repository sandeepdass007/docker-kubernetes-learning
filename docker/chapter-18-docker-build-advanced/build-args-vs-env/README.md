# Docker Build Args vs Environment Variables

## Overview

Docker provides two ways to pass variables into a Dockerfile:

-   **ARG** -- Build-time variables
-   **ENV** -- Runtime environment variables

This example demonstrates how they work, how they differ, and when to
use each.

------------------------------------------------------------------------

## Project Structure

    build-args-vs-env/
    │
    ├── app.py
    ├── Dockerfile
    ├── run.sh
    ├── clean.sh
    └── README.md

------------------------------------------------------------------------

## Key Concepts

### ARG (Build Arguments)

`ARG` variables exist **only during the image build process**.

They can be passed using:

    docker build --build-arg VARIABLE=value

After the image is built, `ARG` variables are **not available inside the
running container** unless explicitly converted into an environment
variable.

Example:

    ARG APP_VERSION=1.0

------------------------------------------------------------------------

### ENV (Environment Variables)

`ENV` variables are **available during both build time and runtime**.

They can be overridden when starting a container:

    docker run -e VARIABLE=value image-name

Example:

    ENV APP_ENV=development

------------------------------------------------------------------------

## Dockerfile Explanation

This Dockerfile demonstrates how `ARG` and `ENV` interact.

1.  Define a build argument (`APP_VERSION`)
2.  Define a runtime environment variable (`APP_ENV`)
3.  Convert the build argument into an environment variable so the
    container can access it

Example flow:

    ARG APP_VERSION=1.0
    ENV APP_ENV=development
    ENV APP_VERSION=$APP_VERSION

This allows the build-time variable to be visible inside the running
container.

------------------------------------------------------------------------

## Running the Example

Run the script:

    ./run.sh

This script demonstrates three scenarios.

------------------------------------------------------------------------

## Scenario 1 --- Default Build

Build without providing a build argument.

Command:

    docker build -t args-env-demo .

Expected output:

    Build Version (from ARG->ENV): 1.0
    Runtime Environment (ENV): development

------------------------------------------------------------------------

## Scenario 2 --- Custom Build Argument

Build the image with a different version.

Command:

    docker build --build-arg APP_VERSION=2.5 -t args-env-demo .

Expected output:

    Build Version (from ARG->ENV): 2.5
    Runtime Environment (ENV): development

------------------------------------------------------------------------

## Scenario 3 --- Override Environment Variable at Runtime

Run the container with a different runtime environment.

Command:

    docker run -e APP_ENV=production args-env-demo

Expected output:

    Build Version (from ARG->ENV): 2.5
    Runtime Environment (ENV): production

------------------------------------------------------------------------

## Comparison

  Feature                        ARG   ENV
  ------------------------------ ----- -----
  Available during build         Yes   Yes
  Available during runtime       No    Yes
  Override during docker build   Yes   No
  Override during docker run     No    Yes

------------------------------------------------------------------------

## Real‑World Usage

### ARG is commonly used for

-   Selecting dependency versions
-   Choosing base image versions
-   Build flags in CI/CD pipelines

Example:

    ARG NODE_VERSION=20
    FROM node:${NODE_VERSION}

------------------------------------------------------------------------

### ENV is commonly used for

-   Application configuration
-   Database URLs
-   Runtime modes

Example:

    ENV NODE_ENV=production

------------------------------------------------------------------------

## Key Takeaway

Use:

-   **ARG for build-time configuration**
-   **ENV for runtime configuration**

If you need a build argument to be visible inside the running container,
convert it into an environment variable:

    ENV VARIABLE_NAME=$VARIABLE_NAME
