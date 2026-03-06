from flask import Flask
import os

app = Flask(__name__)

def read_secret(path):
    try:
        with open(path, "r") as f:
            return f.read().strip()
    except:
        return "Secret not found"

@app.route("/")
def home():
    secret = read_secret("/run/secrets/db_password")
    return f"Database password loaded securely: {secret}"

if __name__ == "__main__":
    app.run(host="0.0.0.0", port=5001)