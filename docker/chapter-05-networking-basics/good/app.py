"""
GOOD SCENARIO: Explicit port publishing

Same app.
Same server.
Different outcome — because networking is declared.
"""

from http.server import HTTPServer, SimpleHTTPRequestHandler

HOST = "0.0.0.0"
PORT = 8000

print("Server starting inside container...")
print(f"Listening on {HOST}:{PORT}")

HTTPServer((HOST, PORT), SimpleHTTPRequestHandler).serve_forever()
