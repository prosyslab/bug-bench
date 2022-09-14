#!/bin/bash
CONFIG_OPTIONS="--disable-shared --disable-freetype"
./autogen.sh
./configure $CONFIG_OPTIONS

SMAKE_I_DIR="sparrow/util/swftophp"

if [[ $1 == "sparrow" ]]; then
  $SMAKE_BIN --init
  $SMAKE_BIN
  cp $SMAKE_I_DIR/*.i $SMAKE_OUT
elif [[ $1 == "infer" ]]; then
  $INFER_BIN capture -- $MAKE_PARAMS
  mv infer-out $OUT
else
  echo "Unknown build target"
  exit 1
fi