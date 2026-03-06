# Chapter 10 — Image Layering (Efficient Builds)

This chapter focuses on how **Docker image layers** are created and how layer ordering impacts build speed and image size.

You will compare two approaches:

- `bad-layering/` — copies the whole context early, invalidating cache frequently
- `good-layering/` — installs dependencies first, then copies application code

Each example includes a `Dockerfile` and a short explanation of why the build behaves the way it does.

---

## How to run

Choose an example and build it manually:

```bash
cd docker/chapter-10-layers/bad-layering
docker build -t chapter10-bad .
```

Or:

```bash
cd docker/chapter-10-layers/good-layering
docker build -t chapter10-good .
```

---

## Key takeaway

Small changes to your source code should not invalidate expensive steps (like dependency installs). Layering your Dockerfile correctly makes builds faster and more predictable.
