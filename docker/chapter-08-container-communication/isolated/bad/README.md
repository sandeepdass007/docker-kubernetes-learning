# Chapter 08 — Container Communication: Isolated (Bad)

## What this scenario demonstrates

This scenario intentionally keeps the server and client in separate, non-connected network namespaces. Even though both containers are running, the client cannot reach the server.

This is expected and shows how Docker isolates containers by default.

---

## How to run

```bash
cd docker/chapter-08-container-communication/isolated/bad
./run.sh
```

## Clean up

```bash
./clean.sh
```
