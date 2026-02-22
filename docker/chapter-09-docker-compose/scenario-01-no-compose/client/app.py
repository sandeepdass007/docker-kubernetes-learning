"""
CLIENT APPLICATION — INTENTIONAL FAILURE

This client runs INSIDE a Docker container.

Goal:
- Attempt to reach a server using http://localhost:5001
- Fail loudly and clearly
- Teach what "localhost" really means inside containers

This failure is NOT a bug.
It is the lesson.
"""

import requests
import socket
import time

SERVER_URL = "http://localhost:5001"

print("\n================ CLIENT STARTING ================\n")

# Identify where we are running
hostname = socket.gethostname()
print(f"CLIENT INFO:")
print(f"- Hostname (container id): {hostname}")
print(f"- We are INSIDE a Docker container")
print()

print("CLIENT ACTION:")
print(f"- Attempting to reach SERVER at {SERVER_URL}")
print("- Expectation: THIS SHOULD FAIL")
print()

try:
    # Short timeout so we don't hang forever
    response = requests.get(SERVER_URL, timeout=3)

    # If this prints, something is very wrong conceptually
    print("UNEXPECTED SUCCESS ❌")
    print("This means the container somehow reached host localhost.")
    print("Response:", response.text)

except requests.exceptions.ConnectionError as e:
    print("EXPECTED FAILURE ✅")
    print("Reason: Connection refused")
    print()
    print("EXPLANATION:")
    print("- 'localhost' inside THIS container refers to THIS container")
    print("- Nothing is listening on port 5001 here")
    print("- The host's port mappings are NOT visible inside containers")

except Exception as e:
    print("UNEXPECTED ERROR TYPE ❌")
    print(type(e).__name__, str(e))

print("\n================ CLIENT FINISHED ================\n")