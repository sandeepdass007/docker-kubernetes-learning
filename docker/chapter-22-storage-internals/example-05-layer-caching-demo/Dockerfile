FROM python:3.9-slim

WORKDIR /app

# Install dependencies first (cached layer)
COPY requirements.txt .
RUN pip install -r requirements.txt

# Copy app code later (changes often)
COPY app.py .

CMD ["python", "app.py"]