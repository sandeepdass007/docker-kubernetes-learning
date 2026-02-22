# Chapter 11 — Good Example: Multi-Stage Docker Build (Python)

## What is this example?

This example demonstrates a **multi-stage Docker build**, where:

- Dependencies are prepared in a builder stage
- Only runtime-required artifacts are copied into the final image
- The final image contains no build tools

The goal is not optimization — the goal is **correct separation of concerns**.

---

## Understanding Docker Stages

In Docker, **each `FROM` instruction creates a new stage**.

There is no explicit `STAGE` keyword.

When a new `FROM` appears:
- A new filesystem starts
- Previous files disappear
- Nothing is shared unless explicitly copied

Stages can be named using `AS <name>`.

---

## What Happens in This Dockerfile?

### Stage 1 — Builder

- Uses a Python image
- Installs dependencies
- Outputs only the installed packages

This stage exists **only during build time**.

### Stage 2 — Runtime

- Starts from a clean Python image
- Copies dependencies from the builder stage
- Copies application code
- Runs the application

The builder stage is discarded entirely.

---

## What Problem Does This Solve?

The final image contains:
- Application code
- Runtime dependencies

And nothing else.

It does **not** contain:
- pip caches
- build tools
- temporary files
- dependency installation history

This makes the image:
- Smaller
- Cleaner
- Safer
- Easier to audit
- Faster to distribute

---

## What About Docker Cache?

Docker caching becomes **more effective** here.

Because:
- Dependency installation is isolated
- Application code changes do not invalidate dependency layers
- Docker can safely reuse layers based on file hashes

Docker does not understand Python.
It only understands:
- Instructions
- File content
- Hashes

This Dockerfile is structured to **help Docker reuse cache correctly**.

---

## Important Clarification

Dockerfiles contain **build logic**.

Images do **not**.

The final image is a frozen filesystem snapshot — not a build recipe.

This example ensures that:
- Build logic exists only at build time
- Runtime containers contain only what they need to execute

---

## Key Takeaway

Multi-stage builds are not an optimization trick.

They are a **design pattern** that enforces:
- Separation of build and runtime
- Minimal runtime environments
- Predictable production behavior

If two images behave the same at runtime,
the better image is the one that contains less.

This example demonstrates exactly that.