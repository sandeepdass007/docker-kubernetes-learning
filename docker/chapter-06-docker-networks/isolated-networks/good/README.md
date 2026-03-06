# Isolated Networks — GOOD (Expected, Controlled Isolation)

## What this scenario demonstrates

This scenario shows the same isolation behavior as the "bad" case, but positions the result as an intentional, correct outcome: containers on different networks cannot communicate.

This is how Docker enables strong isolation between services.

---

## How to run

```bash
cd docker/chapter-06-docker-networks/isolated-networks/good
./run.sh
```

## What to expect

The client will fail to reach the server, and that failure is the point. This proves network isolation is working as designed.

---

## Key takeaway

If you want containers to communicate, they must be on the same Docker network. Otherwise, they are isolated by design.
