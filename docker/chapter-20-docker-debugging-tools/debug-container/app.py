import time
import os

print("Starting debug container...")

counter = 0

while True:
    print(f"Heartbeat {counter}")
    print(f"PID: {os.getpid()}")
    time.sleep(3)
    counter += 1