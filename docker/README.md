# Docker – Hands-on Learning Guide

This folder contains a **chapter-by-chapter Docker learning path**, designed for hands-on exploration.

Each chapter focuses on one core concept, includes runnable code, and encourages experimentation.

---

## How to use this guide

From the repo root:

```bash
cd docker
```

Then pick a chapter and follow its README.

---

## Chapters (current)

1. Chapter 01 — Hello World
2. Chapter 02 — Image Layers & Cache
3. Chapter 03 — Dockerfile Best Practices
4. Chapter 04 — Breaking Data (Volumes)
5. Chapter 05 — Container Networking Basics
6. Chapter 06 — Docker Networks (bridge, host, none, user-defined)
7. Chapter 07 — Network Drivers (bridge/host/none deep dive)
8. Chapter 08 — Container-to-Container Communication
9. Chapter 09 — Docker Compose
10. Chapter 10 — Image Layering (efficient builds)
11. Chapter 11 — Multi-stage Builds
12. Chapter 12 — Volumes (bind/named/tmpfs)
13. Chapter 13 — Environment Variables & Secrets

---

## How chapters are structured

Most chapters include:

- A `README.md` describing the goal and how to run it
- `run.sh` / `clean.sh` scripts for easy experimentation
- `bad/` and `good/` subfolders when a “broken vs fixed” comparison is valuable

---

## Quick start

From the `docker` folder, run a chapter:

```bash
cd docker/chapter-01-hello-world
./run.sh
```

---

## Keep learning

- Run chapters repeatedly
- Read the Dockerfiles and scripts
- Break things intentionally
- Real understanding comes from doing
