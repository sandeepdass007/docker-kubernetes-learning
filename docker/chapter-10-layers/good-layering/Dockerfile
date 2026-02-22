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
# Requirements Copy Layer
# ----------------------------------------------------
# Copy only requirements file first
COPY requirements.txt .

# ----------------------------------------------------
# Dependency Install Layer
# ----------------------------------------------------
# This is the expensive layer
# Docker caches it unless requirements.txt changes
RUN pip install -r requirements.txt

# ----------------------------------------------------
# Application Code Layer
# ----------------------------------------------------
# Now copy rest of the code
COPY app.py .

# ----------------------------------------------------
# Default Command Layer
# ----------------------------------------------------
CMD ["python", "app.py"]