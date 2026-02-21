# Chapter 07 — Network Drivers (Bridge) — GOOD Scenario

## What this scenario demonstrates

This scenario fixes the failure by:
- Creating a user-defined bridge network
- Attaching both containers to the same network
- Using Docker DNS correctly

---

## What is correct here

- Bridge network explicitly created
- SERVER and CLIENT on same network
- CLIENT resolves SERVER by container name
- Communication succeeds

---

## Why user-defined bridge networks matter

Docker provides:
- Automatic DNS resolution
- Network isolation
- Predictable discovery

Only if you opt in.

---

## Files explained

### Dockerfile
Same image for both roles.

### app.py
- SERVER listens on a port
- CLIENT connects using container name
- DNS works due to shared network

### run.sh
- Creates network
- Starts SERVER
- Starts CLIENT
- Shows success

### clean.sh
Stops containers and removes network.

---

## How to run

```bash
./run.sh
```

---

## Expected output

```text
CLIENT received response from server
```

---

## Key takeaway

Containers communicate by network design, not coincidence.
