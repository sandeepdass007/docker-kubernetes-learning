# Good Port Mapping (Placeholder)

This folder is intended to demonstrate **correct port mapping** when using Docker’s default bridge network.

Currently the example files are placeholders. The key idea is that you need to map the container port to a host port (`-p hostPort:containerPort`) in order to access the service from the host.

---

## What you should see

A container that listens on a port inside the container and is reachable from the host via a mapped port.

---

## Next steps

If you want to explore this topic, create a small app, a Dockerfile, and a `run.sh` that publishes a port using `-p`.
