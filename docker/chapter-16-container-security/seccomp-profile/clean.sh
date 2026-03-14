#!/bin/bash

docker rm -f seccomp-test-no-profile 2>/dev/null
docker rm -f seccomp-test 2>/dev/null
docker rmi seccomp-demo 2>/dev/null