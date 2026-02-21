import socket
import sys
import time

ROLE = sys.argv[1] if len(sys.argv) > 1 else "server"
PORT = 5000


def run_server():
    print("SERVER starting...")
    s = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
    s.bind(("0.0.0.0", PORT))
    s.listen(1)

    print(f"SERVER listening on port {PORT}")

    conn, addr = s.accept()
    print(f"SERVER got connection from {addr}")
    conn.sendall(b"HELLO FROM SERVER\n")
    conn.close()


def run_client():
    print("CLIENT starting...")
    time.sleep(2)

    host = "server"
    print(f"CLIENT trying to connect to {host}:{PORT}")

    s = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
    s.connect((host, PORT))
    data = s.recv(1024)
    print("CLIENT received:", data.decode())
    s.close()


if ROLE == "server":
    run_server()
else:
    run_client()