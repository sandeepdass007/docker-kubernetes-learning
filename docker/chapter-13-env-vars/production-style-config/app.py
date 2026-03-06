import os

print("\n=== APPLICATION CONFIGURATION ===\n")

# Environment variables
app_env = os.getenv("APP_ENV")
api_url = os.getenv("API_URL")
log_level = os.getenv("LOG_LEVEL")

print("Environment Variables")
print("---------------------")
print(f"APP_ENV: {app_env}")
print(f"API_URL: {api_url}")
print(f"LOG_LEVEL: {log_level}")

print("\nSecrets")
print("---------------------")

# Read secrets
try:
    with open("/run/secrets/db_password") as f:
        db_password = f.read().strip()

    with open("/run/secrets/jwt_secret") as f:
        jwt_secret = f.read().strip()

    print(f"DB_PASSWORD: {db_password}")
    print(f"JWT_SECRET: {jwt_secret}")

except FileNotFoundError:
    print("Secrets not found")