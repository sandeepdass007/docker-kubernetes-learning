# Chapter 08 — Container-to-Container Communication

This chapter explores **how containers talk to each other**, and why networking configuration matters.

You will see:
- What happens when containers are started without a shared network
- How a shared user-defined network enables container name resolution

---

## Chapter structure

- `isolated/` — demonstrates containers running but unable to communicate
- `same-network/` — demonstrates successful communication using a shared network

Each subfolder contains a `run.sh` and `clean.sh` script to exercise the scenario.

---

## How to run

```bash
cd docker/chapter-08-container-communication/isolated/bad
./run.sh
```

Then clean up:

```bash
./clean.sh
```
```
