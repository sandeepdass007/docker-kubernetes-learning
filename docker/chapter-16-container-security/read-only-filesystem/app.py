import time

print("Container started")
print("Attempting to write to filesystem...")

try:
    with open("/app/output.txt", "w") as f:
        f.write("This should fail")
    print("Write succeeded")
except Exception as e:
    print("Write failed:", e)

while True:
    print("Container still running...")
    time.sleep(5)