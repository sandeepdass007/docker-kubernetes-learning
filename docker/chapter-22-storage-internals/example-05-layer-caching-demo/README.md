
# Chapter 22 — Example 05: Docker Layer Caching (Why Builds Are Fast/Slow)

## Goal of This Example

This example demonstrates **Docker layer caching** and why Docker builds can be:
- Very fast (when cache is used)
- Very slow (when cache is invalidated)

Understanding this is critical for:
- CI/CD pipelines
- Optimizing Dockerfiles
- Reducing build times
- Production deployments

---

## Folder Structure

layer-caching-demo/
│
├── app.py
├── requirements.txt
├── Dockerfile
├── run.sh
├── clean.sh
└── README.md

---

## Concept: Docker Build Cache

Docker builds images layer by layer.

If a layer has not changed, Docker reuses it from cache instead of rebuilding it.

But if a layer changes, all layers AFTER it must rebuild.

This means Dockerfile order is very important.

---

## Dockerfile Bad Order (Slow Builds)

If you write Dockerfile like this:

    COPY . .
    RUN pip install -r requirements.txt

Then every time any file changes, pip install runs again → slow builds.

---

## Dockerfile Good Order (Fast Builds)

Correct way:

    COPY requirements.txt .
    RUN pip install -r requirements.txt
    COPY . .

Now pip install only runs when requirements.txt changes.

This makes builds much faster.

---

## What run.sh Does

The script demonstrates:

1. First build (no cache) → Slow
2. Second build (cache used) → Fast
3. Modify app.py → Only last layer rebuilds
4. Modify requirements.txt → Dependency layer rebuilds (slow again)

This shows how Docker caching works.

---

## Expected Output

You will see during build:

    Using cache

for layers that are reused.

When cache is invalidated, Docker rebuilds that layer and all layers after it.

---

## Real-World Impact

| Change | What Rebuilds |
|-------|---------------|
| app.py | Only last layer |
| requirements.txt | Dependencies layer + after |
| Base image | Everything |
| Dockerfile order wrong | Cache useless |

---

## Key Learning

- Docker builds are layer-based
- Layer order matters
- Dependencies should be installed before copying app code
- This makes CI/CD builds much faster
