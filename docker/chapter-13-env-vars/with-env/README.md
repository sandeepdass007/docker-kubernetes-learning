# Chapter 13 --- Environment Variables

## Scenario: with-env

This example demonstrates how to provide configuration to a Docker
container using environment variables at runtime instead of hardcoding
values inside the application code.

This is the recommended and industry-standard approach for containerized
applications.

------------------------------------------------------------------------

# Objective

In this example we will:

• Build a Docker image containing the application code\
• Pass configuration values when the container starts\
• Allow the same image to run in different environments

------------------------------------------------------------------------

# Folder Structure

with-env/ │ ├── app.py ├── Dockerfile ├── run.sh └── clean.sh

------------------------------------------------------------------------

# Key Concept

Applications should read configuration from environment variables
instead of hardcoded values.

Example:

ENVIRONMENT=production\
APP_MESSAGE="Hello from Docker"

Inside Python this is accessed using:

os.environ.get("ENVIRONMENT")

------------------------------------------------------------------------

# app.py Explanation

The application reads configuration from the container environment.

If variables are not provided, default values are used.

Example:

ENVIRONMENT = os.environ.get("ENVIRONMENT", "development")

This means:

If ENVIRONMENT exists → use it\
If not → default to "development"

------------------------------------------------------------------------

# Dockerfile Explanation

The Docker image only contains:

• Python runtime\
• Application code\
• Dependencies

It does NOT contain environment configuration.

This makes the image reusable.

------------------------------------------------------------------------

# run.sh Explanation

The run script demonstrates how to inject configuration when the
container starts.

docker run -p 5001:5001 -e ENVIRONMENT=production -e APP_MESSAGE="Hello
from Docker Environment Variables!" env-app

Important flag:

-e KEY=value

This passes environment variables into the container.

------------------------------------------------------------------------

# Running the Example

Step 1 --- Make script executable

chmod +x run.sh

Step 2 --- Run container

./run.sh

Step 3 --- Open browser

http://localhost:5001

Expected output:

Environment: production\
Message: Hello from Docker Environment Variables!

------------------------------------------------------------------------

# Why This Matters

Using environment variables allows the same container image to run in
different environments.

Example:

Developer Laptop\
ENVIRONMENT=development

QA Environment\
ENVIRONMENT=staging

Production Environment\
ENVIRONMENT=production

Same image, different runtime configuration.

------------------------------------------------------------------------

# Industry Principle

This pattern follows the 12-Factor App methodology which states:

"Configuration should be stored in the environment."

------------------------------------------------------------------------

# Next Scenario

Next we will implement:

env-file/

Instead of passing many -e flags, we will store configuration in a
`.env` file and load it using:

docker run --env-file .env
