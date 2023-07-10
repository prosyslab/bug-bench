#!/usr/bin/env bash

./autogen.sh
./configure

MAKE_PARAMS="-j"

if [[ $1 == "sparrow" ]]; then
  $SMAKE_BIN --init
  $SMAKE_BIN $MAKE_PARAMS
  mv sparrow/src/appl/*.i $SMAKE_OUT
elif [[ $1 == "infer" ]]; then
  echo "not implemented"
elif [[ $1 == "haechi" ]]; then
  echo "not implemented"
else
  make -j
fi
