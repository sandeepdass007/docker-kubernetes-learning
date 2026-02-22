# ----------------------------------------------------
# Stage 1: Builder
# ----------------------------------------------------
FROM python:3.11-slim AS builder

WORKDIR /build

COPY requirements.txt .

# Install dependencies into a separate directory
RUN pip install --no-cache-dir -r requirements.txt --target /deps

# ----------------------------------------------------
# Stage 2: Runtime
# ----------------------------------------------------
FROM python:3.11-slim

WORKDIR /app

# Copy only the final dependencies
COPY --from=builder /deps /usr/local/lib/python3.11/site-packages

# Copy only application code
COPY app.py .

CMD ["python", "app.py"]