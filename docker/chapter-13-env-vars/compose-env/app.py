from flask import Flask
import os

app = Flask(__name__)

@app.route("/")
def home():
    app_name = os.getenv("APP_NAME", "Default App")
    app_env = os.getenv("APP_ENV", "development")

    return f"""
    <h1>{app_name}</h1>
    <p>Environment: {app_env}</p>
    """

if __name__ == "__main__":
    app.run(host="0.0.0.0", port=5001)