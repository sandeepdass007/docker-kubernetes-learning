#!/bin/bash

echo "Starting application with tini..."

trap "echo 'SIGTERM received'; exit 0" SIGTERM

while true
do
  echo "App running..."
  sleep 5
done