import socket
import sys

def log(msg):
    print(msg)
    sys.stdout.flush()   # <-- THIS IS THE KEY

SERVER_HOST = "chapter9-server"
SERVER_PORT = 5000

log("CLIENT: starting")
log("CLIENT: resolving server name...")

ip = socket.gethostbyname(SERVER_HOST)
log(f"CLIENT: server resolved to {ip}")

log("CLIENT: connecting...")
s = socket.create_connection((SERVER_HOST, SERVER_PORT))

response = s.recv(1024)
log(f"CLIENT: received response: {response.decode()}")

s.close()
log("CLIENT: finished successfully")