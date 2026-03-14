import time
import sys

print("Application started\n")

print("Sleeping for 10 seconds to simulate work...\n")

time.sleep(10)

print("Simulating application crash...\n")

sys.exit(1)