# Scenario 1 — bad-localhost

## What this scenario demonstrates

A client container attempts to reach another container using:

    http://localhost:5000

This **fails by design**.

---

## Why it fails (the real reason)

- Each container has its **own network namespace**
- `localhost` always refers to **the same container**
- The server container is NOT listening inside the client container

So this line:

    requests.get("http://localhost:5000")

means:

> “Call port 5000 inside *my own container*”

There is nothing listening there → connection refused.

---

## Key takeaway

`localhost` never crosses container boundaries.

If this ever works, something else (like port publishing) is involved.

---

## This failure is correct behavior

Docker is not broken.
Your mental model was incomplete.

The next scenarios will fix this **properly**.
