# Docker Security Example --- No New Privileges (Privilege Escalation Demo)

## Overview

This example demonstrates how Docker prevents **privilege escalation**
using the security option:

    --security-opt no-new-privileges

The container includes a **setuid root binary** that attempts to
escalate privileges from a non‑root user to root.

We run the container in two modes:

1.  **Without `no-new-privileges`** → escalation succeeds\
2.  **With `no-new-privileges`** → escalation is blocked

This clearly demonstrates how the security control protects the
container.

------------------------------------------------------------------------

## Why this matters

Linux allows programs with the **setuid bit** to run with the privileges
of the file owner (often root).

Attackers sometimes exploit this mechanism to gain root access.

Docker's `no-new-privileges` option instructs the kernel:

> A process and its children are **not allowed to gain additional
> privileges**.

Even if a binary attempts escalation, the kernel will block it.

------------------------------------------------------------------------

## Folder Structure

    no-new-privileges/
       app.py
       escalate.c
       Dockerfile
       run.sh
       clean.sh
       README.md

------------------------------------------------------------------------

# Experiment 1 --- Privilege Escalation Allowed

Edit `run.sh` and temporarily remove the security option:

    docker run -d   --name no-new-privileges   no-new-privileges

Run:

    ./run.sh

Check logs:

    docker logs no-new-privileges

Expected output:

    Current UID: 1001
    Before escalation UID: 1001
    After escalation UID: 0

This means:

    Privilege escalation SUCCESSFUL

The setuid binary allowed the process to become root.

------------------------------------------------------------------------

# Experiment 2 --- Privilege Escalation Blocked

Restore the security flag in `run.sh`:

    docker run -d   --name no-new-privileges   --security-opt no-new-privileges   no-new-privileges

Run again:

    ./run.sh

Check logs:

    docker logs no-new-privileges

Expected output:

    Current UID: 1001
    Before escalation UID: 1001
    After escalation UID: 1001

This means:

    Privilege escalation BLOCKED

The kernel prevented the privilege change.

------------------------------------------------------------------------

## How the Example Works

1.  `escalate.c` creates a program that attempts:

```{=html}
<!-- -->
```
    setuid(0)

2.  The binary is configured as:

```{=html}
<!-- -->
```
    setuid root

3.  The container runs as a **non‑root user (UID 1001)**

4.  When the program runs:

-   Without protection → privilege escalation works
-   With `no-new-privileges` → escalation fails

------------------------------------------------------------------------

## Security Insight

Production container security usually combines multiple protections:

-   Run containers as **non‑root users**
-   Use **read‑only filesystems**
-   **Drop unnecessary Linux capabilities**
-   Enable **no-new-privileges**
-   Apply **seccomp syscall filtering**

This layered model significantly reduces the impact of container
compromises.

------------------------------------------------------------------------

## Kubernetes Equivalent

In Kubernetes the same protection is configured with:

    securityContext:
      allowPrivilegeEscalation: false

This prevents containers from gaining additional privileges during
execution.

------------------------------------------------------------------------

## Cleanup

    ./clean.sh

------------------------------------------------------------------------

## Key Takeaway

Even if a container includes a vulnerable or malicious binary capable of
escalating privileges, enabling:

    --security-opt no-new-privileges

ensures the kernel blocks the escalation attempt.
