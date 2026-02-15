"""
Simple data processing script used for Dockerfile best-practices demonstration.

What this script does:
- Loads a CSV file
- Prints a preview
- Prints summary statistics
- Prints row count

This mimics a small data engineering workload without noise.
"""

import os
import pandas as pd

# Relative path — important for Docker later


# /app/app/main.py → go one level up to /app
PROJECT_ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))

DATA_PATH = os.path.join(PROJECT_ROOT, "data", "sample_data.csv")


def main():
    # Load dataset
    df = pd.read_csv(DATA_PATH)

    print("=== Dataset Preview ===")
    print(df.head())

    print("\n=== Summary Statistics ===")
    print(df.describe())

    print("\n=== Row Count ===")
    print(len(df))


if __name__ == "__main__":
    main()
