# Chapter 08 — Container Communication: Same Network (Good)

## What this scenario demonstrates

This scenario creates a shared Docker network so that the client can resolve and reach the server using the service name.

The key idea: **containers must be on the same network to talk to each other**.

---

## How to run

```bash
cd docker/chapter-08-container-communication/same-network/good
./run.sh
```

## Clean up

```bash
./clean.sh
```
