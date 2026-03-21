# Chapter 21 — Image Registries
## Example 1: Private Image Registry (Local) + Push/Pull Workflow

---

## 🎯 Objective

In this example, we simulate a **real-world production scenario** where:

- You build a Docker image locally
- Push it to a **private image registry**
- Pull and run it from the registry

This mimics how teams use:
- AWS ECR
- Azure ACR
- Google Artifact Registry
- Self-hosted registries

---

## 🧠 Why This Matters (Real-World Context)

In production:

- You NEVER deploy directly from local images
- You ALWAYS push images to a registry
- Kubernetes pulls images from registries

This example shows:
- Image distribution
- Version control of images
- Decoupling build vs deploy

---

## 🏗️ What We Are Building

We will:

1. Run a **local Docker registry container**
2. Build an app image
3. Tag it for the registry
4. Push it to the registry
5. Delete local image (simulate fresh environment)
6. Pull it back from registry
7. Run container from pulled image

---

## 📁 Folder Structure

```
local-registry-demo/
│── app.py
│── Dockerfile
│── run.sh
│── clean.sh
│── README.md
```

---

## ⚙️ How It Works

### Step 1 — Start Local Registry

```
docker run -d -p 5001:5000 --name local-registry registry:2
```

This creates a **private registry at:**
http://localhost:5001

---

### Step 2 — Build Image

```
docker build -t my-app .
```

---

### Step 3 — Tag Image for Registry

```
docker tag my-app localhost:5001/my-app:v1
```

---

### Step 4 — Push to Registry

```
docker push localhost:5001/my-app:v1
```

---

### Step 5 — Delete Local Image (IMPORTANT)

```
docker rmi localhost:5001/my-app:v1
```

This simulates:
👉 New machine / CI environment

---

### Step 6 — Pull from Registry

```
docker pull localhost:5001/my-app:v1
```

---

### Step 7 — Run Container

```
docker run -d -p 5000:5000 --name registry-demo localhost:5001/my-app:v1
```

---

## 🧪 Expected Output

- `docker images` should show image pulled from registry
- `docker ps` should show running container
- Access:

```
http://localhost:5000
```

You should see:
```
Hello from Registry Demo!
```

---

## 🔥 Real Production Mapping

| This Example | Production Equivalent |
|-------------|----------------------|
| localhost:5001 | AWS ECR / Docker Hub |
| docker push | CI/CD pipeline push |
| docker pull | Kubernetes pulling image |
| manual tagging | versioning (v1, v2, latest) |

---

## 🚨 Common Issues (Important Learning)

### 1. Push Fails (Connection Refused)
- Registry not running

### 2. Pull Fails
- Wrong tag or registry URL

### 3. Image Not Found
- Forgot to push

---

## 💡 Key Takeaways

- Registry is **central source of truth**
- Images must be **tagged properly**
- Build and deploy are **separate concerns**
- This is **mandatory knowledge for Kubernetes**

---

## 🚀 Next Step

Next example will cover:
👉 Authentication & secure registries (production-grade)

