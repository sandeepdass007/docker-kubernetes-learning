# Scenario 02 — Compose Server

This service runs a simple HTTP server and is exposed to other services in the Compose network.

The `client` service can reach it using the service name `server`.

---

## How to run

From the `scenario-02-with-compose` folder:

```bash
docker compose up --build
```

Once running, the server is reachable within the Compose network at `http://server:5001`.
