import os
import time

print("Container started")
print("Current UID:", os.getuid())

print("Attempting privilege escalation...")

os.system("/app/escalate")

while True:
    print("Container running with no-new-privileges enabled...")
    time.sleep(5)