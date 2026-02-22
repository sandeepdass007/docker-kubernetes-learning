# Bad Docker Layering Example

## Purpose
This example demonstrates **inefficient Docker image layering** caused by
copying the entire project (`COPY . .`) before installing dependencies.

---

## Dockerfile Overview

```dockerfile
FROM python:3.11-slim

WORKDIR /app

COPY . .

RUN pip install --no-cache-dir -r requirements.txt

CMD ["python", "app.py"]
```