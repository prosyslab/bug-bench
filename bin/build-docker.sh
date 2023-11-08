#!/usr/bin/env bash

set -e

# Check the base ubuntu version of docker/Dockerfile
BASE_VERSION="22.04"

PROJECT_HOME="$(cd "$(dirname "${BASH_SOURCE[0]}")" && cd ../ && pwd)"

build_base() {
  echo "build prosyslab/bug-bench-base"
  docker build --no-cache -t prosyslab/bug-bench-base $PROJECT_HOME/docker
  docker push prosyslab/bug-bench-base
  docker tag prosyslab/bug-bench-base prosyslab/bug-bench-base:$BASE_VERSION
  docker push prosyslab/bug-bench-base:$BASE_VERSION
}

build() {
  benchmark=$1
  program_version=$(basename $benchmark)
  version=$program_version-$BASE_VERSION
  program=$(dirname $benchmark | xargs basename)
  echo "build prosyslab/bug-bench-$program:$version"
  docker build --no-cache -t prosyslab/bug-bench-$program:$version $benchmark
  docker push prosyslab/bug-bench-$program:$version
}

if [[ $1 == "base" ]]; then
  build_base
elif [[ $1 == "all" ]]; then
  build_base
  for benchmark in $(find $PROJECT_HOME/benchmark -name "Dockerfile"); do
    benchmark=$(dirname $benchmark)
    build $benchmark
  done
elif [[ -d $1 ]]; then
  build $1
else
  echo "Invalid argument"
fi
