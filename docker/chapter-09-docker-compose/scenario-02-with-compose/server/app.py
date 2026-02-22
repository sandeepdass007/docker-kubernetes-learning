"""
SERVER CONTAINER
----------------
This server listens on port 5001 and waits for exactly one client.

Key learning:
- The server does NOT know anything about Docker Compose
- It only listens on 0.0.0.0
- Networking is handled outside the app
"""

import socket

HOST = "0.0.0.0"
PORT = 5001

print("SERVER: starting...")
print(f"SERVER: listening on port {PORT}")

s = socket.socket()
s.bind((HOST, PORT))
s.listen(1)

conn, addr = s.accept()
print(f"SERVER: connection from {addr}")

data = conn.recv(1024)
print(f"SERVER: received -> {data.decode()}")

conn.sendall(b"Hello from SERVER (via Docker Compose)")
conn.close()