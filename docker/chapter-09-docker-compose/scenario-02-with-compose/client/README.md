# Scenario 02 — Compose Client

This service acts as a client that connects to the `server` service using the service name (DNS) provided by Docker Compose.

It depends on `server` being available.

---

## How to run

From the `scenario-02-with-compose` folder:

```bash
docker compose up --build
```

The client will automatically run and attempt to connect to `http://server:5001`.
