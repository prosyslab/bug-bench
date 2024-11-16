#!/usr/bin/env bash

if [[ $1 == "sparrow" ]]; then
  echo "not ready yet"
elif [[ $1 == "infer" ]]; then
  echo "not ready yet"
elif [[ $1 == "codeql" ]]; then
  echo "not ready yet"
elif [[ $1 == "haechi" ]]; then
  echo "not ready yet"
else
  echo "Unknown build target"
  exit 1
fi
