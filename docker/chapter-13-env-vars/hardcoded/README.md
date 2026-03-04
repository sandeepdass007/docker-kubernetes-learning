# Chapter 13 --- Hardcoded Configuration (Problem Demonstration)

This example demonstrates **why hardcoding configuration inside
application code is a bad practice** when building containerized
applications.

The goal is to show the limitation before introducing **Docker
Environment Variables**.

------------------------------------------------------------------------

## Folder Structure

hardcoded/ ├── app.py\
├── Dockerfile\
├── run.sh\
├── clean.sh\
└── README.md

------------------------------------------------------------------------

## What This Example Demonstrates

The application contains configuration values **directly inside the
source code**:

-   APP_ENV
-   APP_VERSION
-   APP_PORT

Example inside `app.py`:

APP_ENV = "development"\
APP_VERSION = "1.0"\
APP_PORT = 5001

Because the values are hardcoded, **changing configuration requires
modifying the code and rebuilding the Docker image**.

This is not ideal for real-world deployments.

------------------------------------------------------------------------

## Build and Run

Run the application using:

./run.sh

This script will:

1.  Build the Docker image
2.  Run the container
3.  Map port 5001 from the container to the host

Open your browser:

http://localhost:5001

You will see the configuration values displayed.

------------------------------------------------------------------------

## The Problem

Imagine deploying the same application to multiple environments:

Development: APP_ENV=development

Staging: APP_ENV=staging

Production: APP_ENV=production

With hardcoded configuration you must:

1.  Edit `app.py`
2.  Rebuild the Docker image
3.  Redeploy

This creates multiple images for the same application.

------------------------------------------------------------------------

## Real-World Best Practice

Applications should read configuration from **environment variables**
instead of hardcoding values.

Example:

APP_ENV=production\
APP_VERSION=2.0\
APP_PORT=5001

Docker allows injecting these values at runtime using:

docker run -e

We will implement this in the next example.

------------------------------------------------------------------------

## Key Learning

Hardcoded configuration causes:

-   Rebuilds for simple config changes
-   Environment-specific images
-   Poor deployment flexibility

Environment variables solve this problem.
