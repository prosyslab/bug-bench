#!/usr/bin/env bash

./configure

MAKE_PARAMS="-j CFLAGS=-w"
SMAKE_I_DIR="sparrow/binutils/readelf"

if [[ $1 == "sparrow" ]]; then
  $SMAKE_BIN --init
  $SMAKE_BIN ./configure
  $SMAKE_BIN $MAKE_PARAMS
  cp $SMAKE_I_DIR/*.i $SMAKE_OUT
elif [[ $1 == "infer" ]]; then
  $INFER_BIN capture -- $MAKE_PARAMS
  mv infer-out $OUT
else
  echo "Unknown build target"
  exit 1
fi
