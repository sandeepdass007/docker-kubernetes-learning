# Bridge Network — GOOD Example

This scenario demonstrates **correct container-to-container communication**
using Docker’s default bridge network.

## What exists
- A SERVER container
- A CLIENT container
- Both attached to the default bridge network

## What changed from BAD
The client connects using:

    bridge-good-server

instead of:

    localhost

## Why this works
- Docker provides built-in DNS for bridge networks
- Container names resolve to container IPs
- No manual IP management required

## Key lesson
> Containers communicate via names, not localhost.