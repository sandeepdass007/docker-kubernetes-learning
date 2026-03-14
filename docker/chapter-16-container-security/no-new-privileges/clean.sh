#!/bin/bash

docker stop no-new-privileges 2>/dev/null || true
docker rm no-new-privileges 2>/dev/null || true
docker rmi no-new-privileges 2>/dev/null || true