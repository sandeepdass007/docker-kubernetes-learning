# ----------------------------------------------------
# Base Image Layer
# ----------------------------------------------------
# This pulls the official Python image
# If not present locally, Docker downloads it once
FROM python:3.11

# ----------------------------------------------------
# Working Directory Layer
# ----------------------------------------------------
# Creates /app inside container
WORKDIR /app

# ----------------------------------------------------
# Copy Layer
# ----------------------------------------------------
# Copy all files
COPY . .

# ----------------------------------------------------
# Dependency Install Layer
# ----------------------------------------------------
# This is the expensive layer
# Docker caches it unless requirements.txt changes
RUN pip install -r requirements.txt

# ----------------------------------------------------
# Default Command Layer
# ----------------------------------------------------
CMD ["python", "app.py"]