#!/usr/bin/env bash

set -e

PROJECT_HOME="$(cd "$(dirname "${BASH_SOURCE[0]}")" && cd ../ && pwd)"
DOCKER_FILE_FULL=$PROJECT_HOME/docker/bugfix/full/Dockerfile-full

# Make Dockerfile for full bugfix benchmarks
python3 $PROJECT_HOME/bin/make_bugfix_docker_full.py $DOCKER_FILE_FULL

# Build the docker image for full version bugfix
pushd $PROJECT_HOME
docker build . -t prosyslab/bug-bench-fix-full -f $DOCKER_FILE_FULL
popd
