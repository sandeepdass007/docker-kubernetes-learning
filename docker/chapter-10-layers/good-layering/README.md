# Good Docker Layering Example

## Purpose
This example demonstrates **efficient Docker image layering**
by separating dependency installation from application code.

---

## Dockerfile Overview

```dockerfile
FROM python:3.11-slim

WORKDIR /app

COPY requirements.txt .

RUN pip install --no-cache-dir -r requirements.txt

COPY app.py .

CMD ["python", "app.py"]
```