# Chapter 03 — Dockerfile Best Practices

This chapter teaches **how to write Dockerfiles that build fast, stay small, and behave predictably**.

It does this by comparing two versions of the same app:
- A deliberately **bad** Dockerfile that wastes cache and creates large images
- A **good** Dockerfile that uses caching effectively and produces a lean image

---

## What you will learn

- How Docker rebuilds layers when files change
- Why COPY order matters for caching
- Why you should install dependencies before copying application code
- Why smaller base images are often better (security, size, speed)

---

## Files in this chapter

- `Dockerfile.bad` — an intentionally bad Dockerfile
- `Dockerfile.good` — a better, production-style Dockerfile
- `run_bad.sh` / `run_good.sh` — build & run the images
- `cleanup.sh` — removes the images and containers created by this chapter
- `app/` — a tiny Python app and its requirements
- `data/` — example data used by the app

---

## How to run

### Run the bad Dockerfile

```bash
cd docker/chapter-03-dockerfile-best-practices
./run_bad.sh
```

### Run the good Dockerfile

```bash
cd docker/chapter-03-dockerfile-best-practices
./run_good.sh
```

### Clean up

```bash
cd docker/chapter-03-dockerfile-best-practices
./cleanup.sh
```

---

## Key takeaway

A well‑structured Dockerfile saves time and avoids surprises by making caching behave predictably. The goal is to change only the layers that really need rebuilding.
