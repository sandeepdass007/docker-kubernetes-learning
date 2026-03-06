# Chapter 12 — Volumes & Persistent Data

This chapter covers the different ways Docker can persist and share data:

- **No volume** — data lives inside the container filesystem (ephemeral)
- **Bind mount** — maps a host directory into a container
- **Named volume** — Docker-managed persistent storage
- **tmpfs** — in-memory temporary storage

Each subfolder is a self-contained example with scripts to run and clean up.

---

## Examples

- `no-volume/` — shows data lost when the container is removed
- `bind-mount/` — demonstrates persisting data on the host filesystem
- `named-volume/` — demonstrates Docker-managed persistent volumes
- `tmpfs/` — demonstrates in-memory storage that disappears when the container stops

---

## How to explore

Choose an example and follow its README:

```bash
cd docker/chapter-12-volumes/bind-mount
./run.sh
```
