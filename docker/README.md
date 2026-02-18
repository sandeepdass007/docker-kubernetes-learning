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
├── README.md                  # Repository overview & progress
├── bootstrap.sh               # One-time local setup helper
├── verify.sh                  # Sanity checks for environment
│
├── docker/
│   ├── README.md              # Docker handbook overview
│   │
│   ├── chapter-01-hello-world/
│   │   ├── Dockerfile
│   │   ├── run.sh
│   │   ├── clean.sh
│   │   └── README.md
│   │
│   ├── chapter-02-image-layers/
│   │   ├── Dockerfile
│   │   ├── run.sh
│   │   ├── clean.sh
│   │   └── README.md
│   │
│   ├── chapter-03-dockerfile-best-practices/
│   │   ├── Dockerfile.bad
│   │   ├── Dockerfile.good
│   │   ├── run_bad.sh
│   │   ├── run_good.sh
│   │   ├── cleanup.sh
│   │   ├── app/
│   │   │   ├── main.py
│   │   │   ├── requirements.txt
│   │   │   └── run.sh
│   │   ├── data/
│   │   │   └── sample_data.csv
│   │   └── README.md
│   │
│   └── chapter-04-breaking-data/
│       ├── Dockerfile
│       ├── app.py
│       ├── run.sh
│       ├── clean.sh
│       └── README.md
│
└── kubernetes/
    └── README.md              # Kubernetes roadmap (coming next)
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

---

## Status

This repository is **actively evolving**.

Only **completed, runnable, and documented chapters** are included.
Future topics appear only after they are fully implemented.

Break things. Re-run chapters. Read the code.

That’s how infrastructure becomes intuitive.
