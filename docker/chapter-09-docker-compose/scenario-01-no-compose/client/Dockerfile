# We use the same base image as the server to avoid noise.
# This chapter is about networking, not Python differences.
FROM python:3.11-slim

# Install requests because this container is a CLIENT.
# Clients initiate HTTP calls.
RUN pip install --no-cache-dir requests

# Set working directory inside the container.
WORKDIR /app

# Copy client application code.
COPY app.py .

# Run the client.
# This container will START, ATTEMPT a connection, LOG everything, and EXIT.
CMD ["python", "app.py"]