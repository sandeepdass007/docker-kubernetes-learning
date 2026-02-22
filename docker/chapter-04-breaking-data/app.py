from datetime import datetime
from pathlib import Path

data_dir = Path("/app/data")
data_dir.mkdir(exist_ok=True)

file_path = data_dir / "data.txt"

with open(file_path, "a") as f:
    f.write(f"Written at {datetime.now()}\n")

print("Current file contents:")
print(file_path.read_text())
