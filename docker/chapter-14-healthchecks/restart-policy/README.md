
# Chapter 14 – Restart Policies

## Goal

Demonstrate how Docker can **automatically restart containers when they crash**.

This simulates a real production scenario where:

1. Application starts normally
2. After some time the application crashes
3. Docker restart policy restarts the container automatically

This is one of the first **self‑healing mechanisms** in container systems.

---

## Folder Structure

restart-policy/
    app.py
    Dockerfile
    run.sh
    clean.sh
    README.md

---

## Application Behaviour

The application:

1. Starts normally
2. Runs for **20 seconds**
3. Exits with a failure code

This simulates an application crash.

Docker restart policy will then restart the container automatically.

---

## Restart Policy Used

We use:

--restart=always

Meaning:

If the container stops **for any reason**, Docker automatically restarts it.

Other restart policies exist:

| Policy | Behavior |
|------|------|
no | default, container will not restart |
on-failure | restart only if container exits with error |
always | always restart container |
unless-stopped | restart unless user manually stops it |

---

## Running the Example

Make scripts executable:

chmod +x run.sh clean.sh

Start the demo:

./run.sh

The script:

1. Builds the Docker image
2. Runs the container in detached mode
3. Waits 10 seconds
4. Shows container status

---

## Observe Restart

Run:

docker ps

Then wait about **20–30 seconds** and run:

docker ps again.

You will notice:

- container uptime resets
- restart count increases

---

## Check Restart Count

Run:

docker inspect restart-demo

Look for:

RestartCount

This shows how many times Docker restarted the container.

---

## View Logs

docker logs -f restart-demo

You will see the application repeatedly starting again after crashing.

---

## Cleanup

Run:

./clean.sh

This script will:

1. Stop container
2. Remove container
3. Remove image

---

## Why This Matters

Restart policies allow Docker to automatically recover from failures.

This is a **basic self‑healing mechanism**.

In orchestrators like Kubernetes this behavior becomes more advanced:

Docker restart policy
        ↓
Kubernetes Pod restartPolicy
