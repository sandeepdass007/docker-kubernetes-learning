FROM python:3.11-slim

WORKDIR /app

# Copy config first (rarely changes)
COPY config.txt .

# Copy application code (changes often)
COPY app.py .

CMD ["python", "app.py"]