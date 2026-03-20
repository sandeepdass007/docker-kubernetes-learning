# Chapter 19 --- Container Process Model

## Overview

This chapter demonstrates how **Docker containers run processes** and
why understanding the **PID 1 process** is critical when building
production containers.

In Docker, a container is **not a virtual machine**. It simply runs a
process in isolation.\
The **first process started inside the container becomes PID 1**, and it
has special responsibilities in Linux.

------------------------------------------------------------------------

# What We Ran

We built and started three containers:

  -----------------------------------------------------------------------
  Container               Image                   Purpose
  ----------------------- ----------------------- -----------------------
  bad-demo                process-bad             Demonstrates shell-form
                                                  CMD problem

  good-demo               process-good            Demonstrates exec-form
                                                  CMD

  tini-demo               process-tini            Demonstrates proper
                                                  init system using tini
  -----------------------------------------------------------------------

Docker output:

Running BAD container...
733cd791ae9225445aeecb00dac5bc1729de73149f470a89577459c1298a9aed

Running GOOD container...
8639bd2a59763a3de93bf1e419d6f0a5b3f0ce5295ddc4b8b365e90ce2244ee4

Running TINI container...
6a5fbd0f1d9a64500951fcbdd9078b8a284ed7918dac72595bea9d1db76c14ed

------------------------------------------------------------------------

# Observing the Process Tree

We inspected processes inside containers using:

docker exec -it `<container>`{=html} ps aux

------------------------------------------------------------------------

# BAD Container (Shell Form CMD)

Process output:

PID 1 /bin/sh -c ./app.sh PID 7 /bin/bash ./app.sh PID 33 sleep 5

Process tree:

/bin/sh (PID 1) └── app.sh └── sleep

Problem:

Docker interpreted the command as:

/bin/sh -c ./app.sh

Meaning:

-   `sh` becomes PID 1
-   the actual application becomes a child process

This can cause:

-   signal forwarding issues
-   shutdown delays
-   zombie processes

This is why **shell-form CMD is discouraged**.

------------------------------------------------------------------------

# GOOD Container (Exec Form CMD)

Dockerfile used:

CMD \["./app.sh"\]

Expected process model:

app.sh (PID 1) └── sleep

Benefits:

-   the application becomes PID 1
-   signals are delivered correctly
-   container shutdown behaves correctly

Exec form ensures Docker does **not insert `/bin/sh` automatically**.

------------------------------------------------------------------------

# TINI Container (Proper Production Setup)

Process output:

PID 1 /usr/bin/tini -- ./app.sh PID 7 /bin/bash ./app.sh PID 37 sleep 5

Process tree:

tini (PID 1) └── app.sh └── sleep

`tini` acts as a **minimal init system**.

Responsibilities:

-   forwards signals to the application
-   reaps zombie processes
-   ensures clean container shutdown

This pattern is commonly used in **production containers**.

------------------------------------------------------------------------

# Why PID 1 Is Special

In Linux, PID 1 has special responsibilities:

1.  Handling system signals
2.  Reaping zombie processes
3.  Acting as the root of the process tree

If your application becomes PID 1 but does not properly manage child
processes, it can lead to:

-   zombie processes
-   stuck containers
-   improper shutdown behavior

------------------------------------------------------------------------

# Best Practices Learned

1.  **Avoid shell-form CMD**

Bad:

CMD python app.py

Good:

CMD \["python", "app.py"\]

------------------------------------------------------------------------

2.  **Understand PID 1 behavior**

The first process inside the container controls the container lifecycle.

------------------------------------------------------------------------

3.  **Use an init system for production**

Use:

docker run --init

or

tini

Example:

ENTRYPOINT \["/usr/bin/tini", "--"\]

------------------------------------------------------------------------

# Key Takeaways

Containers are just **isolated processes**.

Understanding the process model helps avoid:

-   zombie processes
-   broken signal handling
-   containers that refuse to stop

The safest production pattern:

tini (PID 1) └── application

------------------------------------------------------------------------

# What We Learned in This Chapter

-   Containers run **one main process**
-   That process becomes **PID 1**
-   Shell-form CMD introduces an unwanted shell layer
-   Exec-form CMD is the correct Docker practice
-   `tini` provides a lightweight init system for production containers

------------------------------------------------------------------------

# Next Chapter

Chapter 20 --- Docker Debugging Tools

We will explore powerful debugging commands such as:

-   docker inspect
-   docker logs
-   docker stats
-   docker events
-   nsenter
-   strace

These tools are essential for diagnosing **real production container
issues**.
