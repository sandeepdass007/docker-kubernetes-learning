# Docker & Kubernetes – Hands-on Learning Repository

## What is this repository?

This repository is a **hands-on, chapter-by-chapter learning guide** for:
- Docker
- Kubernetes

It is designed like a **technical handbook**:
- **Books** → Docker / Kubernetes
- **Chapters** → One core concept at a time
- **Every chapter is runnable**
- **Every file is documented** (not just README-driven)

This repo shows **where the project stands today**, not a future promise.

---

## Learning Philosophy

- Learn by **running real commands**
- Minimal theory, **maximum clarity**
- Explain *what happens behind the scenes*
- One concept per chapter
- Fully local — **no cloud account required**
- Documentation lives **inside the files**, not just in READMEs

---

## Repository Structure (Current State)

```text
docker-kubernetes-learning/
│
├── README.md                  # This file (repo status + navigation)
├── bootstrap.sh               # One-time setup helper
│
├── docker/
│   ├── README.md              # Docker handbook overview
│   ├── chapter-01-basics/
│   │   ├── Dockerfile         # Fully documented Dockerfile
│   │   └── README.md          # Chapter explanation + commands
│   │
│   └── chapter-02-image-layers/
│       ├── Dockerfile         # Layer-by-layer explanation
│       └── README.md          # Image layers, caching, inspection
│
└── kubernetes/
    └── (coming soon)
```

---

## Progress Tracker

### Docker (In Progress)

| Chapter | Topic | Status |
|------|------|------|
| Chapter 01 | Docker Basics (image, container, run) | ✅ Completed |
| Chapter 02 | Image Layers & Caching | ✅ Completed |
| Chapter 03 | Dockerfile Best Practices | ⏳ Planned |
| Chapter 04 | Volumes & Persistence | ⏳ Planned |
| Chapter 05 | Networking Basics | ⏳ Planned |

### Kubernetes

| Topic | Status |
|------|------|
| Fundamentals | ⏳ Planned |
| Pods & Deployments | ⏳ Planned |
| Services & Ingress | ⏳ Planned |

---

## How to Start

```bash
git clone https://github.com/sandeepdass007/docker-kubernetes-learning.git
cd docker-kubernetes-learning
./bootstrap.sh
```

Then navigate into any chapter and run the commands mentioned in its README.

---

## How to Use This Repo Effectively

1. Start with **Docker → Chapter 01**
2. Read the README **once**
3. Open the Dockerfile and **read comments line by line**
4. Run the commands yourself
5. Inspect outputs (`docker ps`, `docker images`, `docker history`)
6. Move to the next chapter only after understanding *why* it worked

---

## Who Is This For?

- Beginners who want **real understanding**
- Developers who use Docker but never learned it properly
- Engineers preparing for interviews
- Teams creating internal learning material

---

## Status

This repository is **actively evolving**.  
Each new chapter updates:
- Code
- In-file documentation
- Root README progress tracker

Nothing here is placeholder content.

---

## Contributions

This repo is currently **author-driven** to maintain a clean learning flow.  
Contributions may be opened later once the core structure is complete.
