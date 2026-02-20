"""
BAD Bridge Example

This file runs either:
- a SERVER container
- or a CLIENT container

Both containers exist.
Both run correctly.

The FAILURE occurs because the client uses 'localhost',
which points to itself — not the server container.

This is an intentional design failure.
"""

import socket
import sys
import time

ROLE = sys.argv[1] if len(sys.argv) > 1 else "client"
PORT = 5000


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
    time.sleep(2)  # allow server to start

    server_host = "localhost"  # ❌ WRONG on purpose
    print(f"CLIENT trying to reach {server_host}:{PORT}")

    try:
        s = socket.create_connection((server_host, PORT), timeout=5)
        s.sendall(b"Hello server")
        s.close()
        print("CLIENT sent message")
    except Exception as e:
        print("CLIENT failed as expected:")
        print(e)


if __name__ == "__main__":
    if ROLE == "server":
        run_server()
    else:
        run_client()