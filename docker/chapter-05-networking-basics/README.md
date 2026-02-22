# Docker & Kubernetes – Hands-on Learning Repository

## What is this repository?

This repository is a **hands-on, chapter-by-chapter learning guide** for:
- Docker
- Kubernetes

It is designed like a **technical handbook**:
- **Books** → Docker / Kubernetes
- **Chapters** → One core concept at a time
- **Every chapter is runnable**
- **Every file is documented** (not README-driven only)

This repo reflects the **current, working state of the project** — not future placeholders or incomplete demos.

---

## Learning Philosophy

- Learn by **running real commands**
- Minimal theory, **maximum clarity**
- Focus on *what actually happens behind the scenes*
- One core concept per chapter
- Fully local — **no cloud account required**
- Documentation lives **inside the files** (Dockerfiles, scripts, code), not just READMEs
- Concepts are **intentionally broken and rebuilt** to reinforce learning

---

## Repository Structure (Current)

```text
docker-kubernetes-learning/
│
├── README.md
├── bootstrap.sh
├── verify.sh
│
├── docker/
│   ├── README.md
│   │
│   ├── chapter-01-hello-world/
│   ├── chapter-02-image-layers/
│   ├── chapter-03-dockerfile-best-practices/
│   ├── chapter-04-breaking-data/
│   │
│   └── chapter-05-container-networking/
│       ├── bad/
│       │   ├── app.py
│       │   ├── Dockerfile
│       │   └── run.sh
│       │
│       ├── good/
│       │   ├── app.py
│       │   ├── Dockerfile
│       │   └── run.sh
│       │
│       └── README.md
│
└── kubernetes/
    └── README.md
```

---

## Progress Tracker

### Docker

| Chapter | Topic | Status |
|------|------|------|
| Chapter 01 | Docker Basics (image, container, run) | ✅ Completed |
| Chapter 02 | Image Layers & Caching | ✅ Completed |
| Chapter 03 | Dockerfile Best Practices | ✅ Completed |
| Chapter 04 | Breaking Data & Volumes (Persistence) | ✅ Completed |
| Chapter 05 | Container Networking & Port Mapping | ✅ Completed |

### Kubernetes

| Topic | Status |
|------|------|
| Fundamentals | ⏳ Planned |
| Pods & Deployments | ⏳ Planned |
| Services & Ingress | ⏳ Planned |

---

## Chapter 05 – Container Networking (What You Learned)

This chapter focuses on **how containers communicate with the host machine**.

### Key Concepts Covered
- Containers have their **own isolated network namespace**
- Exposing a port in Dockerfile **does NOT publish it**
- `-p hostPort:containerPort` is mandatory for access
- Difference between:
  - Application running
  - Application being reachable
- Why “container is running” ≠ “service is accessible”

### Structure Philosophy
- **bad/** → container runs but is unreachable
- **good/** → proper port mapping and accessible service
- Both scenarios coexist for comparison and testing

This structure will be followed for **all future chapters**, regardless of how many scenarios exist.

---

## How to Start

```bash
git clone https://github.com/sandeepdass007/docker-kubernetes-learning.git
cd docker-kubernetes-learning
./bootstrap.sh
```

---

## Status

This repository is **actively evolving**.

Only **completed, runnable, and documented chapters** are included.
Future topics appear only after they are fully implemented.

Break things. Re-run chapters. Read the code.

That’s how infrastructure becomes intuitive.
