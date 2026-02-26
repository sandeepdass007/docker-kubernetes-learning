#!/bin/bash

docker rmi -f bind-mount-app 2>/dev/null
rm -rf host-data

echo "Bind mount example cleaned."