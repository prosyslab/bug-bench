#!/usr/bin/env bash

chmod +x ./configure
echo -e  "y\nn\nroot\n\n\n\n\n\n\n" | ./configure

if [[ $1 == "sparrow" ]]; then
  echo "TODO: $1"
  exit 1
elif [[ $1 == "infer" ]]; then
  echo "TODO: $1"
  exit 1
elif [[ $1 == "codeql" ]]; then
  $CODEQL_BIN database create --language=cpp codeql-db
  cp -r codeql-db $OUT
else
  echo "Unknown build target"
  exit 1
fi