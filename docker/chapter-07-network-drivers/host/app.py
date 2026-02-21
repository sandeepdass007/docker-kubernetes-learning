"""
This application intentionally runs a very simple HTTP server.

There is NOTHING Docker-specific in this code.

That is the entire point of this chapter.

When using --network host:
- This process behaves EXACTLY like a normal host process
- Docker does not isolate ports
- Docker does not provide networking abstractions
"""

from http.server import BaseHTTPRequestHandler, HTTPServer

HOST = "0.0.0.0"
PORT = 5000


class SimpleHandler(BaseHTTPRequestHandler):
    def do_GET(self):
        """
        Any HTTP request reaching this handler proves that:
        - The container is reachable
        - Docker networking is NOT involved
        - The host network stack is being used directly
        """
        self.send_response(200)
        self.send_header("Content-type", "text/plain")
        self.end_headers()

        self.wfile.write(
            b"Hello from a container using HOST networking.\n"
            b"This is indistinguishable from a normal host process.\n"
        )


def main():
    print("\n=== HOST NETWORK MODE ===")
    print("Starting HTTP server...")
    print("Network isolation: NONE")
    print("Docker port publishing: DISABLED")
    print("This behaves like running Python directly on the host.")
    print(f"Listening on {HOST}:{PORT}")
    print("==========================\n")

    server = HTTPServer((HOST, PORT), SimpleHandler)
    server.serve_forever()


if __name__ == "__main__":
    main()