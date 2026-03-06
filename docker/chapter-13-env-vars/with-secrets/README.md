# Chapter 13 -- Docker Secrets (with-secrets)

This example demonstrates how to securely pass sensitive data to a
container using **Docker Secrets**.

Secrets are used to store confidential data such as:

-   Database passwords
-   API keys
-   Tokens
-   Certificates

Unlike environment variables, secrets are **not exposed through
`docker inspect`** and are mounted as **read-only files inside the
container**.

------------------------------------------------------------------------

## Folder Structure

with-secrets │ ├── Dockerfile ├── app.py ├── docker-compose.yml ├──
run.sh ├── clean.sh ├── README.md └── secrets └── db_password.txt

------------------------------------------------------------------------

## How Docker Secrets Work

Docker automatically mounts secrets inside the container at the
following default location:

/run/secrets/`<secret_name>`{=html}

Example:

/run/secrets/db_password

Your application reads the secret from this file.

------------------------------------------------------------------------

## Secret File

Path:

secrets/db_password.txt

Example content:

super-secret-password

------------------------------------------------------------------------

## Running the Example

Make scripts executable:

chmod +x run.sh clean.sh

Run the application:

./run.sh

Open your browser:

http://localhost:5001

You should see the secret loaded securely from the file.

------------------------------------------------------------------------

## Cleaning Up

Stop and remove containers:

./clean.sh

------------------------------------------------------------------------

## Why Secrets Instead of Environment Variables

  Method                  Secure    Visible in docker inspect
  ----------------------- --------- ---------------------------
  Hardcoded               No        Yes
  Environment Variables   Partial   Yes
  .env File               Partial   Yes
  Docker Secrets          Yes       No

------------------------------------------------------------------------

## Important Notes

• Secrets are mounted as **read‑only files**.\
• Default mount path is:

/run/secrets/

• File name matches the secret name unless a **target** is specified in
docker-compose.

Example:

services: secret-app: build: . secrets: - source: db_password target:
mysql_password

Then inside the container:

/run/secrets/mysql_password

------------------------------------------------------------------------

## Production Usage

Docker Secrets are mainly designed for:

-   Docker Swarm
-   Kubernetes

Docker Compose supports them mainly for development and learning
environments.
