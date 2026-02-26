from http.server import HTTPServer, BaseHTTPRequestHandler
from datetime import datetime
import os

DATA_DIR = "/data"
FILE_PATH = os.path.join(DATA_DIR, "messages.txt")

os.makedirs(DATA_DIR, exist_ok=True)

class Handler(BaseHTTPRequestHandler):
    def do_GET(self):
        now = datetime.now().isoformat()

        with open(FILE_PATH, "a") as f:
            f.write(f"Request received at {now}\n")

        with open(FILE_PATH, "r") as f:
            content = f.read()

        self.send_response(200)
        self.send_header("Content-Type", "text/plain")
        self.end_headers()
        self.wfile.write(content.encode())

if __name__ == "__main__":
    print("SERVER running on port 5001")
    server = HTTPServer(("0.0.0.0", 5001), Handler)
    server.serve_forever()