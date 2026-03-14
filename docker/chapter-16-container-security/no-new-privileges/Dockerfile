FROM python:3.11-slim

WORKDIR /app

RUN apt-get update && apt-get install -y gcc

COPY escalate.c .
COPY app.py .

RUN gcc escalate.c -o escalate

# Make binary owned by root
RUN chown root:root escalate

# Enable setuid
RUN chmod u+s escalate

RUN useradd -u 1001 appuser
RUN chown -R appuser:appuser /app

USER appuser

CMD ["python", "-u", "app.py"]