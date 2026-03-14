import os
import time

print("Container started")
print("UID:", os.getuid())

print("Trying privileged operation simulation...")

try:
    os.system("ip link")
except Exception as e:
    print("Operation failed:", e)

while True:
    print("Container running with restricted capabilities...")
    time.sleep(5)