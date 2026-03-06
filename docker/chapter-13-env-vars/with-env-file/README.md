
# Chapter 13 – Environment Variables using `.env` File

This example demonstrates how to pass environment variables to a Docker container using an **env file** instead of hardcoding them in the Docker command.

Using an `.env` file is a **common real‑world practice** because it keeps configuration separate from application code.

---

## Folder Structure

env-file/
├── app.py  
├── Dockerfile  
├── run.sh  
├── clean.sh  
├── .env  
└── README.md  

---

## Concept

Previously we learned:

1. **Hardcoded values** – values directly inside the code.
2. **Environment variables (`-e`)** – values passed through the Docker command.

Example:

```
docker run -e DB_HOST=db -e DB_USER=admin -e DB_PASSWORD=secret image-name
```

While this works, it becomes difficult to maintain when there are many variables.

Instead we use an **env file**.

---

## `.env` File

The `.env` file stores all configuration variables.

Example:

```
ENVIRONMENT=production
APP_MESSAGE=Hello from ENV FILE example

DB_HOST=database.internal
DB_USER=admin
DB_PASSWORD=supersecret
```

This file allows us to keep configuration separate from the application code.

---

## Running the Container

Run the container using:

```
./run.sh
```

The script runs:

```
docker run --rm -p 5001:5001 --env-file .env env-file-app
```

Key flag:

```
--env-file .env
```

Docker loads all environment variables from the file.

---

## Access the Application

Open your browser:

```
http://localhost:5001
```

You should see the environment variables displayed by the application.

---

## Why `.env` Files Are Important

Benefits:

- Keeps configuration separate from code
- Easier to manage many variables
- Easier to share configuration across environments
- Cleaner Docker commands

---

## Important Security Rule

`.env` files **should not contain secrets in Git repositories**.

Instead teams usually commit:

```
.env.example
```

Example:

```
DB_HOST=
DB_USER=
DB_PASSWORD=
```

Each developer then creates their own `.env` file locally.

---

## Where This Concept Appears

This pattern is used in:

Docker:
```
docker run --env-file
```

Docker Compose:
```
env_file:
  - .env
```

Kubernetes:
- ConfigMaps
- Secrets

Understanding `.env` files prepares you for **real production deployments**.

---

End of Example
