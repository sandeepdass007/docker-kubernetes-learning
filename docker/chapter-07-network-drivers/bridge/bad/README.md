# Bridge Network — BAD Example

This scenario demonstrates a **common Docker networking mistake**.

## What exists
- A SERVER container (running and listening)
- A CLIENT container (running and attempting connection)
- Both containers attached to Docker's default bridge

## What fails
The client tries to reach the server using:

    localhost

## Why this fails
- Each container has its own network namespace
- `localhost` refers to the container itself
- The server is in a DIFFERENT container

## Key lesson
> Containers do not share localhost.

This failure is intentional and correct.