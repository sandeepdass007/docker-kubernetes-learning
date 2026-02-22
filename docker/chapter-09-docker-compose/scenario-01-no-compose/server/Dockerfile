# Use a minimal Python base image
FROM python:3.11-slim

# Set a clear working directory
WORKDIR /app

# Copy the application code
COPY app.py .

# Expose the port (documentation + tooling hint)
EXPOSE 5000

# Run the server
CMD ["python", "app.py"]