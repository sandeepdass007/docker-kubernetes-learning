# This image runs a very small Python HTTP server
FROM python:3.11-slim

WORKDIR /app

# Install runtime dependency explicitly
RUN pip install --no-cache-dir requests

COPY app.py .

# Expose is documentation only — it does NOT publish ports
EXPOSE 5000

CMD ["python", "app.py"]
