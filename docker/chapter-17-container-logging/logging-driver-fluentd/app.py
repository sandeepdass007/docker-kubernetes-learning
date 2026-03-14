import time

i = 0

while True:
    print(f"Log line {i} - sending logs to fluentd")
    i += 1
    time.sleep(1)