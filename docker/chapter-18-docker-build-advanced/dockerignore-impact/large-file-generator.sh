#!/bin/bash

echo "Generating large dummy file (~100MB)..."

dd if=/dev/zero of=large-dummy-file.bin bs=1M count=100

echo "File created:"
ls -lh large-dummy-file.bin