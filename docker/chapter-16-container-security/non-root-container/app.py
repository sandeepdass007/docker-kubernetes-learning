import os
import getpass
import time

print("Running as user:", getpass.getuser())
print("User ID:", os.getuid())

file_path = "/app/output.txt"

with open(file_path, "w") as f:
    f.write("Container running as non-root user")

print("File written successfully")

while True:
    print("Container still running...")
    time.sleep(5)