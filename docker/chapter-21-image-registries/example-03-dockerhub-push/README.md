# Chapter 21 — Image Registries
## Example 03: Docker Hub Push & Pull (Remote Registry)

---

## 🎯 Objective

This example demonstrates pushing and pulling Docker images from Docker Hub,
which is a real remote image registry used in production environments.

This simulates the real workflow used in CI/CD pipelines and Kubernetes.

---

## 🧠 Real-World Workflow

In real production:

1. Developer builds Docker image
2. Developer/CI logs into Docker Hub
3. Image is tagged with Docker Hub username
4. Image is pushed to Docker Hub
5. On another server, image is pulled from Docker Hub
6. Container runs from pulled image

Kubernetes always pulls images from a registry like Docker Hub.

---

## 🏗️ What This Example Does

The run script will:

1. Build Docker image
2. Ask you to login to Docker Hub
3. Tag image for Docker Hub
4. Push image to Docker Hub
5. Remove local image (simulate new server)
6. Pull image from Docker Hub
7. Run container
8. Show logs

---

## 📁 Folder Structure

```
example-03-dockerhub-push/
│── app.py
│── Dockerfile
│── run.sh
│── clean.sh
│── README.md
```

---

## ⚠️ IMPORTANT

Before running, replace:

```
sandeepdass003
```

inside run.sh with your Docker Hub username.

---

## ▶️ How to Run

```
chmod +x run.sh
./run.sh
```

Then open:

```
http://localhost:5006
```

---

## 🧪 Expected Output

Browser should show:

```
DockerHub Registry Demo
```

---

## 🔥 Real Production Mapping

| Step | Real World |
|------|------------|
| docker build | Developer build |
| docker login | CI/CD login |
| docker push | CI/CD pushes image |
| docker pull | Server/Kubernetes pulls image |
| docker run | Container starts |

---

## 🚨 Common Production Issue — latest Tag Problem

If you push:

```
myapp:latest
```

Kubernetes may keep running old image due to caching.

Correct approach:

```
myapp:v1
myapp:v2
myapp:v3
```

Always use version tags in production.

---

## ✅ Key Takeaways

- Docker Hub is a remote registry
- Images must be tagged with username
- You must login before push
- Servers pull images from Docker Hub
- Always use version tags, not just latest

---

## ⏭️ Next Example

Next example will demonstrate image tagging strategy and the "latest tag problem".

