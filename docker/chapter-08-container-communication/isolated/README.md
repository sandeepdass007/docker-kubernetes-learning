# Container Communication — Isolated (Chapter 08)

This folder demonstrates what happens when two containers run without a shared network.

The server and client run on the same host, but they are **network-isolated**, so the client cannot reach the server.

---

## How to run

```bash
cd docker/chapter-08-container-communication/isolated/bad
./run.sh
```

---

## Clean up

```bash
./clean.sh
```
