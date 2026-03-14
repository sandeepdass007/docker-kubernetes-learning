#!/bin/bash

docker stop read-only-filesystem 2>/dev/null || true
docker rm read-only-filesystem 2>/dev/null || true
docker rmi read-only-filesystem 2>/dev/null || true