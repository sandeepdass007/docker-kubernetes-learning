# Chapter 21 — Image Registries
## Example 02: Private Registry Authentication Concept

---

## 🎯 Objective

This example demonstrates how Docker image registries work with authentication and why login is required in real-world environments such as:

- Docker Hub
- AWS ECR
- Azure ACR
- Google Artifact Registry
- Harbor (on-prem)

---

## 🧠 Real-World Concept

In production:

- Developers build Docker images
- CI/CD pushes images to a registry
- Servers / Kubernetes clusters pull images from registry
- Authentication is required to pull private images

If authentication is missing:
- Image pull fails
- Deployments fail
- Kubernetes pods stay in ImagePullBackOff state

This example simulates the registry workflow.

---

## 🏗️ What This Example Does

The run script will:

1. Start a private Docker registry
2. Build a Docker image
3. Tag the image for the registry
4. Push the image to the registry
5. Delete the local image (simulate new machine)
6. Pull the image from registry
7. Run container from pulled image
8. Show logs

---

## 📁 Folder Structure

```
example-02-private-registry-auth/
│── app.py
│── Dockerfile
│── run.sh
│── clean.sh
│── README.md
```

---

## ▶️ How to Run

```
chmod +x run.sh
./run.sh
```

Then open:

```
http://localhost:5005
```

---

## 🧪 Expected Output

Browser should show:

```
Private Registry Auth Demo
```

Docker logs should show Flask server running.

---

## 🔥 Real Production Mapping

| Local Demo | Production Equivalent |
|-------------|----------------------|
| localhost registry | Docker Hub / AWS ECR |
| docker push | CI/CD pipeline |
| docker pull | Kubernetes pulling image |
| delete local image | New server / new environment |
| authentication | imagePullSecrets |

---

## 🚨 Important Kubernetes Concept

If registry auth is not configured in Kubernetes:

```
ImagePullBackOff
ErrImagePull
```

To fix that, Kubernetes uses:

```
imagePullSecrets
```

This example builds the foundation for that concept.

---

## ✅ Key Takeaways

- Registry stores Docker images
- Images must be tagged properly
- Images are pushed and pulled from registry
- Authentication is required in real environments
- Kubernetes pulls images from registries, not from local machine

---

## ⏭️ Next Example

Next example will demonstrate pushing and pulling from Docker Hub (real remote registry).

