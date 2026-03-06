# Scenario 02 — Docker Compose

This scenario recreates the same client/server setup using **Docker Compose**.

Compose defines both services in a single YAML file and takes care of:
- building images
- creating a network
- starting services in the right order

---

## How to run

From this folder:

```bash
docker compose up --build
```

To stop and clean up:

```bash
docker compose down
```

---

## Notes

- The `docker-compose.yml` file defines two services: `server` and `client`
- The client depends on the server and can reach it using the service name
