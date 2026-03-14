import time

print("Starting CPU intensive task...")

while True:
    x = 0
    for i in range(10_000_000):
        x += i

    print("Loop completed")
    time.sleep(1)