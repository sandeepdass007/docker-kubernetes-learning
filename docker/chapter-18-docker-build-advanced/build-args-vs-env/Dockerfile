FROM python:3.11-slim

WORKDIR /app

# Build-time variable
ARG APP_VERSION=1.0

# Runtime variable
ENV APP_ENV=development

# Convert build arg into env variable
ENV APP_VERSION=$APP_VERSION

COPY app.py .

CMD ["python", "app.py"]