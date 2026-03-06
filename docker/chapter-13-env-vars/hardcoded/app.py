from flask import Flask

app = Flask(__name__)

# Hardcoded configuration
APP_ENV = "development"
APP_VERSION = "1.0"
APP_PORT = 5001


@app.route("/")
def home():
    return f"""
Application Configuration

Environment : {APP_ENV}
Version     : {APP_VERSION}
Port        : {APP_PORT}

This configuration is HARDCODED in the source code.
To change it, the image must be rebuilt.
"""


if __name__ == "__main__":
    print("Starting application with HARDCODED configuration...")
    print(f"Environment : {APP_ENV}")
    print(f"Version     : {APP_VERSION}")
    print(f"Port        : {APP_PORT}")

    app.run(host="0.0.0.0", port=APP_PORT)