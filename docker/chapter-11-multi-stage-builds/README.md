# Chapter 11 — Multi-stage Builds

This chapter teaches how to use **multi-stage Docker builds** to create clean, minimal runtime images.

You will compare:

- `bad-single-stage/` — a single-stage build that includes build tools and unnecessary files
- `good-multi-stage/` — a multi-stage build that separates build-time and runtime artifacts

---

## How to run

Build either example with:

```bash
cd docker/chapter-11-multi-stage-builds/bad-single-stage
docker build -t chapter11-single-stage .
```

Or:

```bash
cd docker/chapter-11-multi-stage-builds/good-multi-stage
docker build -t chapter11-multi-stage .
```

---

## Key takeaway

Multi-stage builds let you keep your runtime images small and secure by only including what is needed to run the application.
