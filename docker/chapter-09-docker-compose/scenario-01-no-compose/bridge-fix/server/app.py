"""
This server listens on port 5000.

IMPORTANT:
- It binds to 0.0.0.0, not localhost
- That makes it reachable from OTHER containers
- We do NOT care about the host in this scenario
"""

from http.server import HTTPServer, BaseHTTPRequestHandler

class Handler(BaseHTTPRequestHandler):
    def do_GET(self):
        print("SERVER: received request")
        self.send_response(200)
        self.end_headers()
        self.wfile.write(b"Hello from bridge network server")

if __name__ == "__main__":
    print("SERVER starting on 0.0.0.0:5000")
    HTTPServer(("0.0.0.0", 5000), Handler).serve_forever()