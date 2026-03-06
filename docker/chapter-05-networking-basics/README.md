# Chapter 05 — Container Networking Basics

This chapter demonstrates why **a running container does not automatically mean a reachable service**.

You will learn:

- Containers run in their own **network namespace**
- `EXPOSE` does not publish a port to the host
- `docker run -p hostPort:containerPort` is required to make services reachable
- Why services can appear to be running yet are inaccessible

---

## Folder structure

- `bad/` — container runs but does **not** publish its port
- `good/` — container runs with port mapping so it is reachable

Each scenario includes:
- `Dockerfile` — builds the image
- `app.py` — a tiny web server
- `run.sh` — builds and runs the container
- `clean.sh` — removes containers (and images, where appropriate)

---

## How to run

### 1) Run the bad example (unreachable service)

```bash
cd docker/chapter-05-networking-basics/bad
./run.sh
```

The container starts, but the service is not accessible from your host.

### 2) Run the good example (port mapping)

```bash
cd docker/chapter-05-networking-basics/good
./run.sh
```

Then open:

- `http://localhost:8000`

You should see a response from the container.

---

## Clean up

```bash
cd docker/chapter-05-networking-basics/bad
./clean.sh

cd ../good
./clean.sh
```

---

## Key takeaway

Publishing a port is the only way to make a container’s service accessible from the host. Running a container does not imply reachability.
