import os
import time
import socket
from http.server import HTTPServer, BaseHTTPRequestHandler

ROLE = os.getenv("ROLE", "client")
SERVER_HOST = os.getenv("SERVER_HOST", "server")
SERVER_PORT = 5000


class SimpleHandler(BaseHTTPRequestHandler):
    def do_GET(self):
        self.send_response(200)
        self.end_headers()
        self.wfile.write(b"Hello from SERVER")


def run_server():
    print("SERVER starting on port 5000")
    server = HTTPServer(("0.0.0.0", SERVER_PORT), SimpleHandler)
    server.serve_forever()


def run_client():
    time.sleep(2)
    print(f"CLIENT attempting to reach {SERVER_HOST}:{SERVER_PORT}")

    ip = socket.gethostbyname(SERVER_HOST)
    print(f"Resolved {SERVER_HOST} → {ip}")

    print("Connection successful")


if ROLE == "server":
    run_server()
else:
    run_client()