from flask import Flask
import os
import datetime

app = Flask(__name__)
DATA_FILE = "/data/runtime.txt"

@app.route("/")
def index():
    now = datetime.datetime.now().isoformat()

    if os.path.exists(DATA_FILE):
        with open(DATA_FILE, "r") as f:
            previous = f.read()
    else:
        previous = "No previous data (fresh start)"

    with open(DATA_FILE, "w") as f:
        f.write(f"Written at {now}")

    return f"""
    <h2>tmpfs Volume Demo</h2>
    <p><b>Previous data:</b> {previous}</p>
    <p><b>Current write:</b> Written at {now}</p>
    """
    
if __name__ == "__main__":
    app.run(host="0.0.0.0", port=5001)