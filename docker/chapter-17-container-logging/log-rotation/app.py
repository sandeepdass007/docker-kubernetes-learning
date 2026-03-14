import time

i = 0

while True:
    print(f"Log line {i} - generating logs quickly to trigger rotation")
    i += 1
    time.sleep(0.01)