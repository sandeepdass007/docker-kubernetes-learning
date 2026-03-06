# Scenario 01 — Bridge Fix (No Compose)

This folder shows how to fix the client/server connectivity issue by creating a **user-defined bridge network**.

When both containers join the same user-defined network, Docker provides DNS resolution between them.

---

## How to run

1. Create the network:

```bash
cd docker/chapter-09-docker-compose/scenario-01-no-compose/bridge-fix
./network.sh
```

2. Run the server:

```bash
cd server
./run.sh
```

3. Run the client:

```bash
cd client
./run.sh
```

---

## Clean up

Each folder has a `clean.sh` script to remove containers.
