# Scenario 01 — Client (No Compose)

This container is a **client** that tries to reach the server at `http://localhost:5001`.

Because the client runs in its own container, `localhost` refers to the client itself, not the host or server.

## How to run

```bash
cd docker/chapter-09-docker-compose/scenario-01-no-compose/client
./run.sh
```

## Expected behavior

The client should fail to connect to the server (connection refused). This is intentional.
