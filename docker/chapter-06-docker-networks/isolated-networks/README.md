# Isolated Networks — GOOD Scenario

## What this scenario demonstrates

This scenario demonstrates **correct understanding** of Docker network isolation.

Even though the application fails to connect, the failure is:
- Expected
- Correct
- Desired

---

## Setup

- SERVER container runs in `net-a`
- CLIENT container runs in `net-b`
- CLIENT attempts to reach SERVER using service name `server`

---

## Expected Output

```text
CLIENT attempting to reach server:5000
DNS resolution failed (EXPECTED)