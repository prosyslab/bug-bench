#!/usr/bin/env bash

./autogen.sh
./configure --without-magick --without-pstoedit

if [[ $1 == "sparrow" ]]; then
  $SMAKE_BIN --init
  $SMAKE_BIN -j
  mv sparrow/src/*.i $SMAKE_OUT
elif [[ $1 == "infer" ]]; then
  $INFER_BIN capture -- make -j
  cp -r infer-out $OUT
else
  echo "Unknown build target"
  exit 1
fi