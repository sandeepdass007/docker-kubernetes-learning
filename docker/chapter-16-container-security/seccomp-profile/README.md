# Seccomp Profile -- Container Security Example

## Overview

This example demonstrates how **Seccomp (Secure Computing Mode)** can be
used to restrict Linux system calls inside a container.

Containers share the **host operating system kernel**, which means any
vulnerability in system calls can potentially be exploited by malicious
code running inside a container. Seccomp allows us to **control which
system calls a container is allowed to execute**, reducing the attack
surface.

In this example, we create a custom Seccomp profile that **blocks the
`clone` system call**, which is used internally by the `fork()` function
in Linux. The Python application inside the container attempts to create
a child process using `os.fork()`. When the Seccomp profile blocks the
syscall, the operation fails.

This demonstrates how Seccomp can prevent potentially dangerous
operations at the **kernel level**.

------------------------------------------------------------------------

# Learning Objectives

After completing this example you will understand:

-   What **Linux system calls** are
-   What **Seccomp** is and why it matters for container security
-   How to run a container with a **custom Seccomp profile**
-   How system calls can be **blocked or restricted**
-   How this concept maps to **Kubernetes container security**

------------------------------------------------------------------------

# Project Structure

    seccomp-profile
    ├── app.py
    ├── Dockerfile
    ├── run.sh
    ├── clean.sh
    ├── seccomp-deny-clone.json
    └── README.md

### File Explanation

  -----------------------------------------------------------------------
  File                        Purpose
  --------------------------- -------------------------------------------
  `app.py`                    Python application that attempts to create
                              a new process using `fork()`

  `Dockerfile`                Builds the container image

  `run.sh`                    Runs the container without a Seccomp
                              profile

  `clean.sh`                  Cleans up containers and images

  `seccomp-deny-clone.json`   Custom Seccomp profile that blocks the
                              `clone` syscall

  `README.md`                 Documentation for this example
  -----------------------------------------------------------------------

------------------------------------------------------------------------

# What is a System Call?

A **system call** is the mechanism used by applications to request
services from the Linux kernel.

Examples include:

    open()
    read()
    write()
    fork()
    clone()
    mount()

When an application performs an operation such as creating a process or
accessing a file, it must invoke a system call.

The kernel then executes the request.

Without restrictions:

    Application → System Call → Kernel → Host System

This means containers potentially have access to **hundreds of system
calls**.

------------------------------------------------------------------------

# What is Seccomp?

**Seccomp (Secure Computing Mode)** is a Linux kernel security feature
that restricts the system calls a process can execute.

Instead of allowing all system calls, Seccomp allows you to define rules
such as:

    Allow these syscalls
    Block these syscalls
    Return an error for these syscalls
    Kill the process if these syscalls are used

In containers this is extremely important because:

-   Containers share the **host kernel**
-   A compromised container could attempt dangerous syscalls
-   Restricting syscalls significantly **reduces attack surface**

------------------------------------------------------------------------

# What This Example Demonstrates

The Python application attempts to create a new process using:

    os.fork()

Internally this relies on the Linux system call:

    clone()

Our Seccomp profile blocks that syscall.

Result:

  Scenario          Result
  ----------------- ---------------
  Without Seccomp   Fork succeeds
  With Seccomp      Fork fails

------------------------------------------------------------------------

# Step 1 -- Build the Container

Run:

    docker build -t seccomp-demo .

This builds the container image containing the Python application.

------------------------------------------------------------------------

# Step 2 -- Run Without Seccomp

Run the container normally:

    docker run --name seccomp-test-no-profile seccomp-demo

Expected output:

    Container started
    Attempting to fork a process...
    Parent process created child PID: 7
    Child process running
    Container running...

Explanation:

-   The container is allowed to call `clone`
-   The child process is created successfully

------------------------------------------------------------------------

# Step 3 -- Run With Seccomp Restriction

Run the container with the custom Seccomp profile:

    docker run \
    --security-opt seccomp=seccomp-deny-clone.json \
    --name seccomp-test \
    seccomp-demo

Expected output:

    Container started
    Attempting to fork a process...
    Fork failed due to security restriction!
    Operation not permitted

Explanation:

-   The `clone` syscall is blocked
-   The kernel rejects the request
-   Python raises an `OSError`

------------------------------------------------------------------------

# Understanding the Seccomp Profile

The profile file:

    seccomp-deny-clone.json

Example configuration:

``` json
{
  "defaultAction": "SCMP_ACT_ALLOW",
  "syscalls": [
    {
      "names": ["clone"],
      "action": "SCMP_ACT_ERRNO"
    }
  ]
}
```

Explanation:

  Field              Meaning
  ------------------ ------------------------------------------
  `defaultAction`    Allow all syscalls by default
  `names`            The syscall being restricted
  `SCMP_ACT_ERRNO`   Return an error when the syscall is used

This configuration allows everything **except the clone syscall**.

------------------------------------------------------------------------

# Docker's Default Seccomp Profile

Docker already uses a **default Seccomp profile**.

It blocks many dangerous syscalls such as:

    keyctl
    add_key
    perf_event_open
    clone (restricted flags)

This example demonstrates how to create **custom restrictions beyond the
default**.

------------------------------------------------------------------------

# Why Seccomp Is Important

Seccomp protects the host system by preventing containers from executing
dangerous kernel operations.

Benefits include:

-   Reduced kernel attack surface
-   Prevention of container escape techniques
-   Limiting damage if an application is compromised
-   Stronger runtime isolation

In production environments, Seccomp is often combined with:

    Non-root containers
    Dropped Linux capabilities
    Read-only filesystems
    No-new-privileges
    AppArmor / SELinux

This layered model is known as **defense in depth**.

------------------------------------------------------------------------

# Kubernetes Equivalent

Kubernetes also supports Seccomp profiles.

Example configuration:

    securityContext:
      seccompProfile:
        type: RuntimeDefault

Or using a custom profile:

    securityContext:
      seccompProfile:
        type: Localhost
        localhostProfile: profiles/seccomp.json

This allows administrators to enforce **kernel-level security policies
for containers**.

------------------------------------------------------------------------

# Cleaning Up

Run:

    ./clean.sh

This removes:

-   Containers
-   Built images

------------------------------------------------------------------------

# Key Takeaways

-   Containers share the **host kernel**
-   System calls are how applications interact with the kernel
-   Seccomp restricts which syscalls are allowed
-   Blocking dangerous syscalls improves container security
-   Seccomp is a **core component of modern container hardening**

------------------------------------------------------------------------

# Security Stack Covered in This Chapter

This example completes the container security section:

    Non-root containers
    Dropped capabilities
    Read-only filesystem
    No new privileges
    Seccomp profiles

Together these mechanisms create a **strong runtime security posture for
containers**.
