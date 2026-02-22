"""
CLIENT CONTAINER
----------------
The client connects to the SERVER using its *service name*.

Key learning:
- 'server' is NOT localhost
- 'server' is a DNS name injected by Docker Compose
"""

import socket
import time

SERVER_HOST = "server"
PORT = 5001

print("CLIENT: starting...")
time.sleep(2)  # Give server time to start (intentional, for learning)

print(f"CLIENT: connecting to {SERVER_HOST}:{PORT}")

s = socket.socket()
s.connect((SERVER_HOST, PORT))

s.sendall(b"Hello from CLIENT")
response = s.recv(1024)

print(f"CLIENT: received -> {response.decode()}")
s.close()