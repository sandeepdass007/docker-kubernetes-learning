from flask import Flask, Response
import time

app = Flask(__name__)

start_time = time.time()

@app.route("/")
def home():
    return "Application running"

@app.route("/health")
def health():

    uptime = time.time() - start_time

    if uptime < 30:
        return "healthy"

    return Response("unhealthy", status=500)

app.run(host="0.0.0.0", port=5002)