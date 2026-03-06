# Host Network Driver

This chapter demonstrates Docker's **host network mode**.

In host mode, the container shares the host’s network stack. The container does not get its own network namespace.

---

## What does `--network host` do?

- The container sees the same network interfaces as the host.
- Ports the container listens on are immediately available on the host.
- Docker does not create a separate bridge network.
- Port mappings (`-p`) are ignored.

---

## How to run

```bash
cd docker/chapter-07-network-drivers/host
./run.sh
```

Once running, the container’s service is available on the host at:

- `http://localhost:5000`

---

## When to use host networking

Host networking can be useful for performance-sensitive applications or when you need direct access to host network interfaces. It also means you lose network isolation between the container and host.
