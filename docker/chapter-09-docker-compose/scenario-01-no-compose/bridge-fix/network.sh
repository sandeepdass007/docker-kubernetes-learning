#!/bin/bash
set -e

echo "Creating user-defined bridge network..."

docker network create chapter9-bridge || true

echo "Network ready."