#!/usr/bin/env bash

MAKE_PARAMS="-j"
SMAKE_I_DIR="sparrow/picocom"

if [[ $1 == "sparrow" ]]; then
  $SMAKE_BIN --init
  $SMAKE_BIN $MAKE_PARAMS
  cp $SMAKE_I_DIR/*.i $SMAKE_OUT
elif [[ $1 == "infer" ]]; then
  $INFER_BIN capture -- make
  cp -r infer-out $OUT
elif [[ $1 == "codeql" ]]; then
  $CODEQL_BIN database create --language=cpp --command="make" codeql-db
  cp -r codeql-db $OUT
else
  echo "Unknown build target"
  exit 1
fi
