# app.py
# This file behaves differently based on ROLE
# ROLE=server → starts a tiny HTTP server
# ROLE=client → tries to call http://server:8000

import os
import time
import requests
from http.server import HTTPServer, BaseHTTPRequestHandler

ROLE = os.getenv("ROLE", "client")

class Handler(BaseHTTPRequestHandler):
    def do_GET(self):
        self.send_response(200)
        self.end_headers()
        self.wfile.write(b"Hello from server")

if ROLE == "server":
    print("Starting server on port 8000...")
    HTTPServer(("0.0.0.0", 8000), Handler).serve_forever()

else:
    time.sleep(2)
    print("Client trying to reach http://server:8000")
    response = requests.get("http://server:8000", timeout=5)
    print("Response:", response.text)