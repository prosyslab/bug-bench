#!/usr/bin/env bash

./configure

MAKE_PARAMS="-j"

if [[ $1 == "sparrow" ]]; then
  $SMAKE_BIN --init
  make -C gnulib -j && make -C common-src -j && make -C amandad-src -j
  $SMAKE_BIN -C client-src runtar $MAKE_PARAMS
  cp sparrow/client-src/runtar.o.i $SMAKE_OUT
elif [[ $1 == "infer" ]]; then
  make -C gnulib -j && make -C common-src -j && make -C amandad-src -j
  $INFER_BIN capture -- make -C client-src runtar
  cp -r infer-out $OUT
elif [[ $1 == "codeql" ]]; then
  $CODEQL_BIN database create --language=cpp --command="make" codeql-db
  cp -r codeql-db $OUT
else
  echo "Unknown build target"
  exit 1
fi
