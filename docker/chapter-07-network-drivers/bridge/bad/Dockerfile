FROM python:3.11-slim

WORKDIR /app
COPY app.py .

# Role (server/client) is decided at runtime
ENTRYPOINT ["python", "app.py"]