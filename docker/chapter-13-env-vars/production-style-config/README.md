# Chapter 13.6 --- Production Style Configuration (Env + Secrets)

## Goal

In real-world systems, applications usually use **two types of
configuration**:

1.  **Environment Variables**
    -   Used for normal configuration values
    -   Example: environment name, API URLs, logging level
2.  **Secrets**
    -   Used for sensitive information
    -   Example: database passwords, API tokens, JWT secrets

This example demonstrates how **both mechanisms are used together** in a
realistic Docker setup.

------------------------------------------------------------------------

## Folder Structure

    production-style-config/
    │
    ├── app.py
    ├── Dockerfile
    ├── docker-compose.yml
    ├── .env
    └── secrets/
          ├── db_password.txt
          └── jwt_secret.txt

------------------------------------------------------------------------

## Environment Variables

Stored inside the `.env` file.

Example:

    APP_ENV=development
    API_URL=https://example-api.com
    LOG_LEVEL=INFO

Docker Compose automatically loads this file and injects the variables
into the container.

The Python app reads them like this:

``` python
import os

app_env = os.getenv("APP_ENV")
api_url = os.getenv("API_URL")
log_level = os.getenv("LOG_LEVEL")
```

------------------------------------------------------------------------

## Secrets

Sensitive values are stored in files under the `secrets/` directory.

Example:

    secrets/db_password.txt
    secrets/jwt_secret.txt

Docker mounts them inside the container at:

    /run/secrets/

The application reads them like this:

``` python
with open("/run/secrets/db_password") as f:
    db_password = f.read().strip()

with open("/run/secrets/jwt_secret") as f:
    jwt_secret = f.read().strip()
```

------------------------------------------------------------------------

## Why This Structure Matters

Production systems separate configuration like this:

  Type                        Example               Mechanism
  --------------------------- --------------------- -----------------------
  Application configuration   ENV name, API URL     Environment Variables
  Sensitive credentials       DB password, tokens   Secrets

Benefits:

-   Secrets are **not stored inside images**
-   Credentials **are not visible in environment variables**
-   Security is improved

------------------------------------------------------------------------

## Running The Example

Start the application:

    docker compose up --build

Stop the containers:

    docker compose down

------------------------------------------------------------------------

## What You Should Observe

When the container starts:

-   Environment variables load from `.env`
-   Secrets are mounted in `/run/secrets`
-   The Python app reads both

This mirrors how **real production systems manage configuration**.

------------------------------------------------------------------------

## Connection to Kubernetes

These Docker concepts map directly to Kubernetes:

  Docker                  Kubernetes
  ----------------------- ------------
  Environment Variables   ConfigMap
  Secrets                 Secret

Understanding this pattern makes Kubernetes configuration much easier
later.
