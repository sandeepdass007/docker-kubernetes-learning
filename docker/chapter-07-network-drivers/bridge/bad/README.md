# Chapter 07 — Network Drivers (Bridge) — BAD Scenario

## What this scenario demonstrates

This scenario intentionally breaks container-to-container communication
by relying on default bridge behavior without explicit networking setup.

The goal is to show:
- Containers do NOT magically discover each other
- Container names are NOT resolvable by default
- Why Docker networking concepts exist at all

---

## Mental Model

Think of containers like laptops:
- Just because two laptops are running
- Does NOT mean they can see each other
- They need to be on the same network with rules

---

## What is intentionally broken here

- SERVER container is started
- CLIENT container is started
- No user-defined bridge network is created
- Client tries to reach server by name
- Docker cannot resolve that name

This failure is expected.

---

## Files explained

### Dockerfile
Same image used for both server and client.
No networking logic lives here.

### app.py
- Can run as SERVER or CLIENT
- SERVER binds to a port
- CLIENT attempts name-based connection
- Fails due to missing DNS

### run.sh
- Builds image
- Starts SERVER
- Starts CLIENT
- Shows failure clearly

### clean.sh
Removes containers so reruns are clean.

---

## How to run

```bash
./run.sh
```

---

## Expected output

```text
socket.gaierror: Name or service not known
```

---

## Key takeaway

Containers are isolated by default.
Networking must be designed — not assumed.
