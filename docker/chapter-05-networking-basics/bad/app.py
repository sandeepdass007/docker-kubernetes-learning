"""
BAD SCENARIO: Network isolation

This app starts a web server INSIDE the container.
It works perfectly — but the host cannot access it.
"""

from http.server import HTTPServer, SimpleHTTPRequestHandler

HOST = "0.0.0.0"
PORT = 8000

print("Server starting inside container...")
print(f"Listening on {HOST}:{PORT}")

HTTPServer((HOST, PORT), SimpleHTTPRequestHandler).serve_forever()
