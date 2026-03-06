# Isolated Networks — BAD (Expected Failure)

## What this scenario demonstrates

This scenario intentionally puts the server and client on **different user-defined networks**, then tries to connect by service name.

This is expected to fail because Docker’s DNS-based service discovery only works within a single network.

---

## How to run

```bash
cd docker/chapter-06-docker-networks/isolated-networks/bad
./run.sh
```

## What to expect

The client will fail to resolve `server` and the connection will not be established.

This behavior is correct and reinforces the fact that containers need to share a network to talk to each other.
