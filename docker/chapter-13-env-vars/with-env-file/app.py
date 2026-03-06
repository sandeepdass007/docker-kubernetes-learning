import os
from flask import Flask

app = Flask(__name__)

environment = os.getenv("ENVIRONMENT", "not-set")
message = os.getenv("APP_MESSAGE", "no-message")

db_host = os.getenv("DB_HOST", "not-set")
db_user = os.getenv("DB_USER", "not-set")
db_password = os.getenv("DB_PASSWORD", "not-set")

@app.route("/")
def home():
    return f"""
    <h2>Environment Variables Demo</h2>
    <p><b>Environment:</b> {environment}</p>
    <p><b>Message:</b> {message}</p>
    <hr>
    <p><b>DB Host:</b> {db_host}</p>
    <p><b>DB User:</b> {db_user}</p>
    <p><b>DB Password:</b> {db_password}</p>
    """

if __name__ == "__main__":
    app.run(host="0.0.0.0", port=5001)