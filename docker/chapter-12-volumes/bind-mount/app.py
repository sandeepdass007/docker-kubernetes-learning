from flask import Flask
import os

app = Flask(__name__)

DATA_FILE = "/data/counter.txt"

@app.route("/")
def counter():
    if not os.path.exists(DATA_FILE):
        with open(DATA_FILE, "w") as f:
            f.write("0")

    with open(DATA_FILE, "r+") as f:
        value = int(f.read())
        value += 1
        f.seek(0)
        f.write(str(value))
        f.truncate()

    return f"Counter value: {value}\n"

if __name__ == "__main__":
    app.run(host="0.0.0.0", port=5001)