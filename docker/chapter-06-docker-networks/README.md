# Chapter 06 — Docker Networks

This chapter explores **how Docker networks work**, why containers can or cannot reach each other, and what options you have for controlling networking.

Docker has several networking modes:
- **bridge (default)** — isolated container network, non-flat
- **host** — container shares the host network stack
- **none** — container has no network
- **user-defined bridge** — allows container name resolution and isolation

---

## What you will learn

- The default behavior of the Docker bridge network
- Why `localhost` is not a magic cross-container address
- How to use user-defined bridge networks to allow name-based discovery
- What host and none modes do (and when they are useful)

---

## Folder structure

- `bad-localhost/` — demonstrates why `localhost` does not work between containers
- `good-port-mapping/` — (placeholder) port mapping on bridge networks
- `isolated-networks/` — shows what happens when containers are put on different networks
  - `bad/` — expected failure due to separate networks
  - `good/` — expected failure that proves isolation works
- `shared-network/` — demonstrates a shared user-defined bridge network
- `host/` — demonstrates `--network host`
- `none/` — demonstrates `--network none`

---

## How to explore

Pick a scenario and follow its README:

```bash
cd docker/chapter-06-docker-networks/bad-localhost
./run.sh
```

Then clean up:

```bash
./clean.sh
```

---

## Note

Some folders may be placeholders for future expanded examples. The core concepts are covered in the working examples.
