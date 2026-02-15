#!/bin/bash

# This script is a developer-friendly entry point.
# It does NOT hide what is happening.
#
# Steps performed:
# 1. Ensure dependencies are installed
# 2. Run the application
#
# This mirrors real-world local development workflows.

set -e  # Exit immediately if a command fails

echo "Installing dependencies..."
pip install -r requirements.txt

echo "Running data processing app..."
python main.py
