#!/usr/bin/env bash

autoreconf -i
./configure

if [[ $1 == "sparrow" ]]; then
  $SMAKE_BIN --init
  $SMAKE_BIN -j
  patch sparrow/schismtracker/03a.page_help.o.i ../03a.page_help.o.i.diff
  cp sparrow/schismtracker/*.i $SMAKE_OUT
elif [[ $1 == "infer" ]]; then
  $INFER_BIN capture -- make
  cp -r infer-out $OUT
else
  echo "Unknown build target"
  exit 1
fi
