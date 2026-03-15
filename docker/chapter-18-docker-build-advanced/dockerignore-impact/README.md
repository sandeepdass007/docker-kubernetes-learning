# Docker Build Advanced --- `.dockerignore` Impact

## Overview

When Docker builds an image, it first sends the **build context** to the
Docker daemon.

The build context is **everything inside the current directory** where
`docker build` is executed.

If large or unnecessary files exist in the directory, they will be
**sent to the Docker daemon**, even if they are not copied into the
image.

This can dramatically slow down Docker builds.

The `.dockerignore` file prevents unnecessary files from being included
in the build context.

This example demonstrates:

• How large files increase Docker build time\
• How `.dockerignore` reduces build context size\
• Why `.dockerignore` is critical for production builds

------------------------------------------------------------------------

## Project Structure

    dockerignore-impact/
    │
    ├── app.py
    ├── Dockerfile
    ├── large-file-generator.sh
    ├── run.sh
    ├── clean.sh
    └── README.md

------------------------------------------------------------------------

## Example Behavior

This example intentionally generates a **large dummy file (\~100MB)** to
simulate real-world scenarios where projects contain:

-   logs
-   node_modules
-   build artifacts
-   temporary files

Without `.dockerignore`, Docker will send the entire directory to the
daemon.

With `.dockerignore`, those files are excluded.

------------------------------------------------------------------------

## Step 1 --- Generate Large File

Run:

    ./large-file-generator.sh

This creates:

    large-dummy-file.bin

------------------------------------------------------------------------

## Step 2 --- Build Image Without `.dockerignore`

Run:

    ./run.sh

Observe Docker output:

    Sending build context to Docker daemon  100MB

This shows the large file is included in the build context.

------------------------------------------------------------------------

## Step 3 --- Add `.dockerignore`

Create a `.dockerignore` file with:

    large-dummy-file.bin

Rebuild the image.

Now the output should look like:

    Sending build context to Docker daemon  5kB

The large file is excluded from the build context.

------------------------------------------------------------------------

## Why `.dockerignore` Matters

Without `.dockerignore`:

• Builds become slow\
• Large files are unnecessarily transferred\
• CI pipelines become inefficient

With `.dockerignore`:

• Faster builds\
• Smaller build context\
• Better CI performance

------------------------------------------------------------------------

## Real Production `.dockerignore` Example

Typical `.dockerignore`:

    .git
    node_modules
    dist
    build
    logs
    *.log
    tmp
    .env

These files are rarely needed inside Docker images.

------------------------------------------------------------------------

## Running the Example

Run:

    ./run.sh

The script will:

1.  Generate the large file
2.  Build the Docker image
3.  Start the container
4.  Display running containers

------------------------------------------------------------------------

## Cleaning Up

Run:

    ./clean.sh

This removes:

• container\
• image\
• generated large file

------------------------------------------------------------------------

## Key Takeaways

• Docker sends the entire directory as build context.\
• `.dockerignore` prevents unnecessary files from being sent.\
• Proper `.dockerignore` usage significantly improves build performance.
