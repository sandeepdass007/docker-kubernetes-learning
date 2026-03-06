# Shared Network Example (Placeholder)

This folder is intended to demonstrate how a shared user-defined Docker network allows multiple containers to communicate using container names.

The example files in this folder are currently placeholders.

---

## Concept

When multiple containers are attached to the same user-defined bridge network, Docker provides DNS-based name resolution, so containers can refer to each other by name.

---

## Next steps

To complete this example, add a server container and a client container, create a network, and attach both containers to it. Use `--network` and `--network-alias` to make service names resolvable.
