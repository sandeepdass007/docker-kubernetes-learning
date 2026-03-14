FROM python:3.11-slim

WORKDIR /app

COPY app.py .

RUN useradd -u 1001 appuser
RUN chown -R appuser:appuser /app

USER appuser

CMD ["python", "-u", "app.py"]