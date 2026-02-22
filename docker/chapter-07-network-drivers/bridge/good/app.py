"""
GOOD Bridge Example

This is the FIXED version of the BAD example.

Difference:
- Client connects using SERVER CONTAINER NAME
- Docker bridge provides automatic DNS resolution

Nothing else changes.
"""

import socket
import sys
import time

ROLE = sys.argv[1] if len(sys.argv) > 1 else "client"
PORT = 5000
SERVER_NAME = "bridge-good-server"  # ✅ container name


def run_server():
    print("SERVER starting...")
    s = socket.socket()
    s.bind(("0.0.0.0", PORT))
    s.listen(1)

    print(f"SERVER listening on port {PORT}")
    conn, addr = s.accept()
    data = conn.recv(1024)
    print("SERVER received:", data.decode())
    conn.close()


def run_client():
    print("CLIENT starting...")
    time.sleep(10)  # allow server to start

    print(f"CLIENT connecting to {SERVER_NAME}:{PORT}")

    s = socket.create_connection((SERVER_NAME, PORT))
    s.sendall(b"Hello from client")
    s.close()

    print("CLIENT successfully sent message")


if __name__ == "__main__":
    if ROLE == "server":
        run_server()
    else:
        run_client()