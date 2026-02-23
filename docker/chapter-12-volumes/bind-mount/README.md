Chapter 12 — Volumes & Persistent Data
================================

Section 12.1 — Bind Mounts (Hands-on)

This README explains Docker Bind Mounts using a clear, step-by-step,
problem → failure → explanation → fix approach.

--------------------------------------------------
WHAT IS A BIND MOUNT?
--------------------------------------------------

A bind mount maps a directory or file from the HOST machine
directly into a container.

Host Path  <------>  Container Path

Example:
/Users/sandeep/app-data  →  /app/data

Key characteristics:
- Uses an EXISTING host path
- Docker does NOT manage the data
- Changes are reflected instantly (host ↔ container)
- Very common in development
- Risky in production if misused

--------------------------------------------------
SCENARIO WE ARE DEMONSTRATING
--------------------------------------------------

We will run a simple Python HTTP server that:
- Writes data to /app/data/message.txt
- Exposes the data via HTTP response
- Runs on port 5001 (important)

We will show:
1) No bind mount → data LOST when container stops
2) Bind mount → data PERSISTS on host

--------------------------------------------------
FOLDER STRUCTURE
--------------------------------------------------

chapter-12-volumes/
└── bind-mount/
    ├── Dockerfile
    ├── app.py
    ├── run.sh
    ├── cleanup.sh
    └── README.md

--------------------------------------------------
DOCKERFILE (EXPLANATION)
--------------------------------------------------

Base image: python:3.11-slim
Working directory: /app
Expose: 5001 (documentation only)
Command: python app.py

EXPOSE does NOT publish ports.
It documents which port the app listens on.

--------------------------------------------------
app.py (WHAT IT DOES)
--------------------------------------------------

- Starts HTTP server on port 5001
- Ensures /app/data exists
- Writes a message to /app/data/message.txt
- Returns file content on HTTP request

This allows us to verify persistence.

--------------------------------------------------
BAD CASE — NO BIND MOUNT
--------------------------------------------------

Run container WITHOUT -v flag.

Result:
- File is created inside container filesystem
- When container stops → data is LOST

This is expected Docker behavior.

--------------------------------------------------
GOOD CASE — WITH BIND MOUNT
--------------------------------------------------

Run container WITH:

-v $(pwd)/host-data:/app/data

Result:
- Data is written to host-data folder
- Stopping container does NOT delete data
- Restarting container reuses same data

--------------------------------------------------
WHY THIS MATTERS
--------------------------------------------------

Without volumes or bind mounts:
- Containers are STATELESS
- Any file-based data is temporary

Bind mounts:
- Enable live development
- Enable persistence
- Introduce security risks if misused

--------------------------------------------------
WHEN TO USE BIND MOUNTS
--------------------------------------------------

GOOD:
- Local development
- Debugging
- Hot reloading code

BAD:
- Production databases
- Multi-host environments
- Kubernetes (uses volumes instead)

--------------------------------------------------
IMPORTANT NOTES
--------------------------------------------------

- Docker does NOT back up bind mounts
- Docker does NOT manage permissions
- Host path MUST exist
- Containers can modify host files

--------------------------------------------------
NEXT SECTION
--------------------------------------------------

Section 12.2 — Docker Named Volumes
- Docker-managed storage
- Safer than bind mounts
- Production-friendly

--------------------------------------------------
END OF FILE
--------------------------------------------------
