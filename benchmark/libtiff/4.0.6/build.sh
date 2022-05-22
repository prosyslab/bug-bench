#!/usr/bin/env bash

./configure

if [[ $1 == "sparrow" ]]; then
  echo "TODO: $1"
  exit 1
elif [[ $1 == "infer" ]]; then
  echo "TODO: $1"
  exit 1
elif [[ $1 == "codeql" ]]; then
  echo "TODO: $1"
  exit 1
else
  make -j
fi
