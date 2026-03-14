data = []

print("Starting memory allocation...")

while True:
    data.append("X" * 10_000_000)  # allocate ~10MB each loop
    print(f"Allocated {len(data) * 10} MB")