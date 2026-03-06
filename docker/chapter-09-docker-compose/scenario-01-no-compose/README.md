# Scenario 01 — No Docker Compose

This scenario shows how to manually wire services together using raw `docker` commands.

It demonstrates:
- Running a server container and publishing a port (`-p host:container`)
- Running a client container that attempts to reach the server using `localhost`
- Why the client cannot reach the server when it is run as a separate container without shared networking

## Structure

- `server/` — builds and runs the server
- `client/` — builds and runs the client (expected to fail)
- `bridge-fix/` — adds a user-defined bridge network so the client can reach the server
