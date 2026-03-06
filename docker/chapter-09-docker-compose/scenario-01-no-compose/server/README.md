# Scenario 01 — Server (No Compose)

This container runs a simple HTTP server listening on port `5000` inside the container.

The server is published to the host on port `5001` using Docker port mapping.

## How to run

```bash
cd docker/chapter-09-docker-compose/scenario-01-no-compose/server
./run.sh
```

## Access

Once running, the server is reachable from the host at:

- `http://localhost:5001`
