# We start from a minimal Python image
# This image is read-only and acts as a TEMPLATE
FROM python:3.11-slim

# All container activity will happen inside /app
# This directory lives INSIDE the container filesystem
WORKDIR /app

# Declare that /app/data is expected to be persistent
VOLUME /app/data

# We copy our application into the container image
# This does NOT create runtime data — only static code
COPY app.py .

# When the container starts:
# - Python runs
# - Data is written
# - Process exits
# - Container stops
CMD ["python", "app.py"]
