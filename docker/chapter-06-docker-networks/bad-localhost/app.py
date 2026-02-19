"""
This app behaves differently based on ROLE.

ROLE=server → starts an HTTP server on port 5000
ROLE=client → tries to call http://localhost:5000
"""

import os
import time
import requests
from http.server import BaseHTTPRequestHandler, HTTPServer

ROLE = os.getenv("ROLE", "server")


class SimpleHandler(BaseHTTPRequestHandler):
    def do_GET(self):
        self.send_response(200)
        self.end_headers()
        self.wfile.write(b"Hello from SERVER container")


def run_server():
    print("Starting SERVER on port 5000...")
    server = HTTPServer(("0.0.0.0", 5000), SimpleHandler)
    server.serve_forever()


def run_client():
    print("CLIENT trying to reach SERVER at http://localhost:5000")
    time.sleep(2)

    try:
        response = requests.get("http://localhost:5000", timeout=5)
        print("Response:", response.text)
    except Exception as e:
        print("Request failed:")
        print(e)


if __name__ == "__main__":
    if ROLE == "server":
        run_server()
    else:
        run_client()
