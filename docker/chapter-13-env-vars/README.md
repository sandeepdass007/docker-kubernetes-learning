# Chapter 13 — Environment Variables & Configuration

This chapter explores how to configure containers using environment variables, files, and secrets.

The goal is to see common patterns and best practices for passing configuration into containers without hardcoding values.

---

## Included examples

- `hardcoded/` — configuration is baked into the image (bad practice)
- `with-env/` — configuration is passed via `-e` / `--env` flags
- `with-env-file/` — configuration is loaded from an `.env` file
- `compose-env/` — Docker Compose with environment variables
- `with-secrets/` — a minimal secrets workflow using file-based secrets
- `production-style-config/` — a more realistic setup using `.env` and secrets

---

## How to use

Each folder includes a `README.md` with instructions for running and cleaning up.

Pick a scenario, read its documentation, and run the included scripts to see how configuration is passed into the container.
