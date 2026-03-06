# Chapter 05 — Container Networking (Bad)

## What this scenario demonstrates

This container runs a web server, but the port is **not published to the host**.

Even though the container is running, you will not be able to access the service from your machine.

---

## How to run

```bash
cd docker/chapter-05-networking-basics/bad
./run.sh
```

## How to verify

Try opening `http://localhost:8000` in your browser. The request should fail.
