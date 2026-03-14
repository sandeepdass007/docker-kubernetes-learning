import time
import sys

counter = 1

while True:
    print(f"[INFO] Job {counter} started")

    time.sleep(2)

    if counter % 4 == 0:
        print(f"[ERROR] Job {counter} failed!", file=sys.stderr)

    else:
        print(f"[SUCCESS] Job {counter} completed")

    print("-" * 40)

    counter += 1