#!/usr/bin/env bash
autoreconf -fiv
./configure

if [[ $1 == "sparrow" ]]; then
  $SMAKE_BIN --init
  $SMAKE_BIN -j10
  mv sparrow/*.i $SMAKE_OUT
elif [[ $1 == "infer" ]]; then
  echo "not implemented yet"
  exit 1
else
  echo "Unknown build target"
  exit 1
fi

