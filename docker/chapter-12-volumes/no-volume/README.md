# Chapter 12 — No Volume (Ephemeral Data)

This example shows what happens when a container writes data to its filesystem **without using any volumes**.

### What you will observe

- The application writes a file inside the container.
- When the container is removed, the file is deleted.
- This demonstrates why containers are not suitable for persistent storage by themselves.

---

## How to run

```bash
cd docker/chapter-12-volumes/no-volume
./run.sh
```

Then remove the container (usually the script does this) and rerun to see the data vanish.

---

## Key takeaway

Without volumes, container data is ephemeral. If you need persistence, use a bind mount, named volume, or another storage mechanism.
