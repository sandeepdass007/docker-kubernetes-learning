import os
import time

print("Container started")
print("Attempting to fork a process...")

try:
    pid = os.fork()

    if pid == 0:
        print("Child process running")
        time.sleep(2)
    else:
        print(f"Parent process created child PID: {pid}")
        os.wait()

except OSError as e:
    print("Fork failed due to security restriction!")
    print(e)

while True:
    print("Container running...")
    time.sleep(5)