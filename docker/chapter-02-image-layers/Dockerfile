# -------------------------------
# STEP 1: Base Image
# -------------------------------
# This creates the first image layer.
# If this doesn't change, Docker will reuse it.
FROM alpine:latest


# -------------------------------
# STEP 2: Working Directory
# -------------------------------
# Sets the working directory inside the container.
# This also creates a new layer.
WORKDIR /app


# -------------------------------
# STEP 3: Copy file into image
# -------------------------------
# This copies message.txt from the host
# into the image.
#
# IMPORTANT:
# If message.txt changes, THIS layer
# and all layers AFTER it will be rebuilt.
COPY message.txt .


# -------------------------------
# STEP 4: Command to run
# -------------------------------
# Displays the contents of message.txt
# when the container starts.
CMD ["cat", "message.txt"]
