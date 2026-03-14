import os

build_version = os.getenv("APP_VERSION", "not-set")
runtime_env = os.getenv("APP_ENV", "not-set")

print("Application Started")
print("----------------------")

print(f"Build Version (from ARG->ENV): {build_version}")
print(f"Runtime Environment (ENV): {runtime_env}")