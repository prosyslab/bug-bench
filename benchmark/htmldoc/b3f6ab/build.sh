#!/bin/bash

./configure

if [ ! $1 ]; then
  make install
elif [[ $1 == "infer" ]]; then
  $INFER_BIN capture -- make
  cp -r infer-out $OUT
else
  echo "Unknown build target"
  exit 1
fi
