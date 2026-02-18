# Chapter 04 — Breaking Data (Why Volumes Exist)

## Why this chapter exists

Up to now, you have learned that:

- A container is essentially a **process**
- A container has its **own filesystem**
- When the process exits, the container stops

This chapter answers a critical question:

> **If containers die, what happens to application data?**

This chapter intentionally **breaks data** to prove why Docker volumes are necessary.

---

## Mental model before starting

Think of a container as:

- A running process
- With isolated memory and filesystem
- Designed to be **ephemeral**
- Expected to stop, restart, or be replaced

Containers are **not** designed to store long‑lived data.

---

## Learning goals (in strict order)

We will go through these **in sequence**:

1. Write data **inside** a container filesystem
2. Let the container exit
3. Observe **data loss**
4. Introduce Docker’s solution: **Volumes**

No multi‑container setups yet.  
That comes later.

---

## Step 1 — Writing data inside a container

The application writes a file (`data.txt`) inside the container filesystem.

Important points:

- This file is **not** a volume
- It exists only while the container exists
- No persistence is configured

When you run the container, you will see confirmation that data was written.

---

## Step 2 — Container exits

Once the application finishes execution:

- The main process exits
- The container stops
- The container filesystem becomes inaccessible

At this point, the data **cannot be accessed anymore**.

This is expected Docker behavior.

---

## Step 3 — Breaking the data (intentional)

After the container is removed:

- The filesystem is destroyed
- The data is permanently lost

This proves a key design principle:

> **Containers must never be the source of truth for data**

If data lives only inside a container, it is unsafe.

---

## Step 4 — Docker’s solution: Volumes

Docker solves this problem using **Volumes**.

A volume is:

- Managed by Docker
- Stored outside the container lifecycle
- Mounted into the container filesystem
- Persistent even after container deletion

With a volume:

- Containers can die
- Data survives

This decouples:
- **Application lifecycle**
- **Data lifecycle**

---

## Where volumes live

Volumes exist on the **host machine**, managed by Docker.

They are not tied to:
- Container restarts
- Image rebuilds
- Process exits

You typically interact with volumes only through Docker commands.

---

## Key takeaways

- Containers are disposable
- Data is not
- Mixing the two leads to data loss
- Volumes exist to separate concerns

This is a **foundational concept** for everything that comes next.

---

## What this chapter does NOT cover (yet)

- Multiple containers
- Shared volumes between services
- Databases
- Networking

Those concepts build on this chapter and will be introduced later.

---

## Clean up

Use the provided cleanup script to remove:

- Containers
- Images
- Volumes created in this chapter

Re‑run the chapter multiple times.
Break it intentionally.
That’s how this concept becomes permanent.
