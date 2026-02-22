# Host Network Driver

This chapter demonstrates Docker's **host network mode**.

There is no "bad" or "good" here.
There is only **what host networking actually is**.

---

## What is Host Networking?

When a container is started with:

```bash
docker run --network host