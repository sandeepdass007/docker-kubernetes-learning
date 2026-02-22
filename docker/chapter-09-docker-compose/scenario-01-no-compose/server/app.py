"""
This is a deliberately simple HTTP server.

Purpose:
- Prove that a process is running inside a container
- Expose a port
- Respond with a visible message
- Log clearly when it starts and when it receives traffic

No frameworks.
No magic.
"""

from http.server import HTTPServer, BaseHTTPRequestHandler


class SimpleHandler(BaseHTTPRequestHandler):
    def do_GET(self):
        print("SERVER: Received a request")
        self.send_response(200)
        self.end_headers()
        self.wfile.write(b"Hello from the SERVER container\n")


if __name__ == "__main__":
    print("SERVER: Starting HTTP server on port 5000")

    server = HTTPServer(("0.0.0.0", 5000), SimpleHandler)
    server.serve_forever()