# Chapter 05 — Container Networking (Good)

## What this scenario demonstrates

This container runs a web server with **port mapping enabled**.

The container is reachable from the host at `http://localhost:8000`.

---

## How to run

```bash
cd docker/chapter-05-networking-basics/good
./run.sh
```

## How to verify

Open your browser at:

- `http://localhost:8000`

You should see a response from the container.
