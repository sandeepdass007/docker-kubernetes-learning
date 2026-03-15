# Stage 1 — Builder
FROM python:3.11-slim AS builder

WORKDIR /app

COPY requirements.txt .

RUN pip install --no-cache-dir -r requirements.txt

COPY app.py .

# Stage 2 — Final Production Image
FROM python:3.11-slim

WORKDIR /app

COPY --from=builder /app /app

CMD ["python", "app.py"]