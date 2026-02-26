# Chapter 12 — Named Volumes (Docker)

This chapter demonstrates **Docker Named Volumes** using a simple Python HTTP server.

The goal is to prove one core concept:

Containers are ephemeral, but **data stored in a named volume persists even after containers are deleted**.

--------------------------------------------------
WHY NAMED VOLUMES EXIST
--------------------------------------------------

Bind mounts depend on the host filesystem path.
Named volumes are managed entirely by Docker.

Benefits:
- Docker controls storage location
- Safer than bind mounts
- Portable across environments
- Foundation for Docker Compose and Kubernetes volumes

--------------------------------------------------
WHAT THIS EXAMPLE DOES
--------------------------------------------------

- A Python server listens on port 5001
- Every HTTP request:
  - Writes a line to /data/messages.txt
  - Reads the entire file back
  - Returns it in the response

The /data directory is backed by a **named Docker volume**.

--------------------------------------------------
FOLDER STRUCTURE
--------------------------------------------------

chapter-12-volumes/
└── named-volume/
    ├── Dockerfile
    ├── app.py
    ├── run.sh
    ├── clean.sh
    └── README.md

--------------------------------------------------
HOW TO RUN
--------------------------------------------------

Step 1: Start the container

./run.sh

Step 2: Open browser

http://localhost:5001

Refresh multiple times. Each refresh appends data.

Step 3: Remove container (but NOT volume)

docker rm -f named-volume-server

Step 4: Run again

./run.sh

Notice:
- Old data is still present
- Container is new
- Volume persisted

--------------------------------------------------
CLEANUP
--------------------------------------------------

./clean.sh

This removes:
- Container
- Named volume

--------------------------------------------------
KEY TAKEAWAYS
--------------------------------------------------

- Volumes are attached at runtime, not build time
- Docker manages named volumes
- Containers can be safely destroyed without losing data
- This concept maps directly to Kubernetes Persistent Volumes
