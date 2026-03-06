# Chapter 12 — tmpfs Volumes (In-Memory Storage)

## What is tmpfs?

A **tmpfs volume** is a temporary, in-memory filesystem.
- Stored in **RAM**, not disk
- Exists **only while the container is running**
- Deleted automatically when the container stops

Think of tmpfs as:
> “Fast scratch space with zero persistence”

---

## Why use tmpfs?

Use tmpfs when:
- You need **speed**
- Data must **never touch disk**
- Data must **disappear on container stop**

### Common use cases
- Temporary caches
- Session data
- Secrets generated at runtime
- Intermediate processing files

---

## Folder Structure

```text
tmpfs/
├── app.py
├── Dockerfile
├── run.sh
├── clean.sh
└── README.md
```

---

## app.py

```python
import os
from flask import Flask

app = Flask(__name__)
DATA_FILE = "/data/tmpfs.txt"

@app.route("/")
def write_and_read():
    with open(DATA_FILE, "w") as f:
        f.write("Hello from tmpfs!")

    with open(DATA_FILE, "r") as f:
        content = f.read()

    return f"Read from tmpfs: {content}"

if __name__ == "__main__":
    app.run(host="0.0.0.0", port=5001)
```

---

## Dockerfile

```dockerfile
FROM python:3.11-slim

WORKDIR /app

COPY app.py .

RUN pip install flask

EXPOSE 5001

CMD ["python", "app.py"]
```

---

## run.sh

```bash
#!/bin/bash

docker build -t tmpfs-app .

docker run --rm   -p 5001:5001   --tmpfs /data   tmpfs-app
```

---

## clean.sh

```bash
#!/bin/bash

docker rmi tmpfs-app
```

---

## How tmpfs is Different from Other Volumes

| Type         | Stored On | Persists After Stop | Docker Managed | Speed |
|--------------|-----------|---------------------|----------------|-------|
| No volume    | Container | ❌ No               | ❌ No           | Medium |
| Bind mount   | Host disk | ✅ Yes              | ❌ No           | Slowest |
| Named volume | Docker    | ✅ Yes              | ✅ Yes          | Medium |
| **tmpfs**    | RAM       | ❌ No               | N/A            | Fastest |

---

## Key Takeaways

- tmpfs is **ephemeral**
- Data lives **only in memory**
- Best for **temporary, sensitive, high-speed data**
- Not suitable for persistence

---

## What’s Next?

You have now completed **ALL volume types**:
- No volume
- Bind mount
- Named volume
- tmpfs

Next logical step:
👉 **Chapter 13 — Environment Variables & Configuration**
