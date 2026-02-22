"""
This application intentionally tests what happens
when a container has NO network stack.

Expected behavior:
- DNS resolution fails
- Socket creation fails
- No outbound connectivity exists

These failures are SUCCESS.
"""

import socket
import sys

print("\n=== NONE NETWORK MODE ===")
print("Attempting to perform network operations...\n")

# Attempt DNS resolution
try:
    print("Resolving google.com...")
    socket.gethostbyname("google.com")
    print("UNEXPECTED: DNS resolution worked")
except Exception as e:
    print("Expected failure: DNS resolution failed")
    print(f"Reason: {e}\n")

# Attempt outbound connection
try:
    print("Attempting TCP connection to google.com:80...")
    s = socket.create_connection(("google.com", 80), timeout=3)
    print("UNEXPECTED: Connection succeeded")
    s.close()
except Exception as e:
    print("Expected failure: Outbound connection failed")
    print(f"Reason: {e}\n")

print("Conclusion:")
print("This container has NO networking capabilities.")
print("Docker has intentionally removed the network stack.")
print("===============================\n")

sys.exit(0)