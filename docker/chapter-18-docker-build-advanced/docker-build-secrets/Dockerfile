# syntax=docker/dockerfile:1.4

FROM python:3.11-slim

WORKDIR /app

COPY app.py .

# Use secret during build
RUN --mount=type=secret,id=mysecret \
    echo "Reading secret during build:" && \
    cat /run/secrets/mysecret

CMD ["python", "app.py"]