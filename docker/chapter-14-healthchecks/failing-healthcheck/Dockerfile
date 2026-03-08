FROM python:3.11-slim

WORKDIR /app

COPY app.py .

RUN apt-get update && apt-get install -y curl
RUN pip install flask

EXPOSE 5002

HEALTHCHECK --interval=10s --timeout=3s --retries=3 \
 CMD curl -f http://localhost:5002/health || exit 1

CMD ["python", "app.py"]