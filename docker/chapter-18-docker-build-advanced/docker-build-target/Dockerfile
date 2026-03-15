# Stage 1 - Builder
FROM python:3.11-slim AS builder

WORKDIR /app

RUN echo "Installing build dependencies..."

COPY app.py .

RUN echo "Builder stage completed"

# Stage 2 - Production
FROM python:3.11-slim AS production

WORKDIR /app

COPY --from=builder /app /app

CMD ["python", "app.py"]