from flask import Flask
import os

app = Flask(__name__)

DATA_DIR = "/data"
DATA_FILE = os.path.join(DATA_DIR, "counter.txt")

os.makedirs(DATA_DIR, exist_ok=True)

@app.route("/")
def index():
    if not os.path.exists(DATA_FILE):
        count = 0
    else:
        with open(DATA_FILE, "r") as f:
            count = int(f.read())

    count += 1

    with open(DATA_FILE, "w") as f:
        f.write(str(count))

    return f"Counter value: {count}\n"

if __name__ == "__main__":
    print("Starting app WITH volume...")
    app.run(host="0.0.0.0", port=5001)