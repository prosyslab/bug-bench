#!/usr/bin/env bash

./configure

MAKE_PARAMS="-j"
SMAKE_I_DIR="sparrow/src/patch"

if [[ $1 == "sparrow" ]]; then
  $SMAKE_BIN --init
  $SMAKE_BIN ./configure
  $SMAKE_BIN $MAKE_PARAMS
  cp $SMAKE_I_DIR/*.i $SMAKE_OUT
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
