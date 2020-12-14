#!/usr/bin/env bash

set -e

PROJECT_HOME="$(cd "$(dirname "${BASH_SOURCE[0]}")" && cd ../ && pwd)"

build_base() {
  echo "build prosyslab/bug-bench-base"
  docker build -t prosyslab/bug-bench-base $PROJECT_HOME/docker
  docker push prosyslab/bug-bench-base
}

build() {
  benchmark=$1
  benchmark_dir=$(dirname $benchmark)
  version=$(dirname $benchmark | xargs basename)
  program=$(dirname $benchmark | xargs dirname | xargs basename)
  echo "build prosyslab/bug-bench-$program:$version"
  docker build -t prosyslab/bug-bench-$program:$version $benchmark_dir
  docker push prosyslab/bug-bench-$program:$version
}

if [[ $1 == "all" ]]; then
  build_base
  for benchmark in $(find $PROJECT_HOME/benchmark -name "Dockerfile"); do
    build $benchmark
  done
elif [[ -d $1 ]]; then
  build $1
else
  echo "Invalid argument"
fi
