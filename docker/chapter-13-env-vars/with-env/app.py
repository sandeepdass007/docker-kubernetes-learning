import os
from flask import Flask

app = Flask(__name__)

# Configuration from environment variables
APP_MESSAGE = os.environ.get("APP_MESSAGE", "Default message")
ENVIRONMENT = os.environ.get("ENVIRONMENT", "development")

@app.route("/")
def home():
    return f"""
Environment: {ENVIRONMENT}
Message: {APP_MESSAGE}
"""

if __name__ == "__main__":
    print("Starting Flask server on port 5001...")
    print("ENVIRONMENT =", ENVIRONMENT)
    print("APP_MESSAGE =", APP_MESSAGE)

    app.run(host="0.0.0.0", port=5001)