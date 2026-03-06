# Chapter 13 --- Docker Environment Variables (Compose Example)

## Overview

This example demonstrates how to pass environment variables to a
container using **Docker Compose** with an **env_file**.

You have already seen:

1.  Hardcoded values
2.  Passing variables using `-e`
3.  Using `--env-file` with `docker run`

This example shows how the same concept works using **Docker Compose**,
which is the standard way to run multi-container applications.

------------------------------------------------------------------------

## Folder Structure

compose-env ├── app.py\
├── Dockerfile\
├── docker-compose.yml\
├── .env\
├── run.sh\
└── clean.sh

------------------------------------------------------------------------

## How It Works

The `.env` file stores environment variables:

    APP_NAME=Compose Environment Example
    APP_ENV=production

In `docker-compose.yml`, these variables are loaded using:

    env_file:
      - .env

Docker Compose reads the file and injects the variables into the
container environment.

The Python application reads these variables using:

    os.getenv("APP_NAME")
    os.getenv("APP_ENV")

------------------------------------------------------------------------

## Build and Run

Make the script executable:

    chmod +x run.sh

Start the application:

    ./run.sh

Docker Compose will:

1.  Build the image
2.  Start the container
3.  Load environment variables from `.env`

------------------------------------------------------------------------

## Access the Application

Open your browser:

    http://localhost:5001

You should see the application displaying values coming from the
environment variables.

------------------------------------------------------------------------

## Stopping the Application

Run:

    ./clean.sh

This will stop and remove the container created by Docker Compose.

------------------------------------------------------------------------

## Why This Approach Is Important

Using `.env` files with Docker Compose allows you to:

-   Keep configuration separate from code
-   Easily switch between environments
-   Avoid hardcoding values inside images

Example environments:

    .env.dev
    .env.staging
    .env.prod

The same Docker image can run in multiple environments with different
configuration values.

------------------------------------------------------------------------

## Key Takeaway

Configuration should never be tightly coupled with application code.

A good containerized application follows:

    Code → Docker Image
    Configuration → Environment Variables
    Orchestration → Docker Compose
