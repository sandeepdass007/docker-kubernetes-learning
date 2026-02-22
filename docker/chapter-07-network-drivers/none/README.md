# None Network Driver

This chapter demonstrates Docker's **none network mode**.

In this mode, the container has **no network stack at all**.

---

## What does `--network none` do?

Docker starts the container without:
- Network interfaces
- Loopback (localhost)
- DNS resolution
- Routing table
- Outbound or inbound connectivity

The container is completely isolated.

---

## What this chapter proves

Run the container:

```bash
./run.sh