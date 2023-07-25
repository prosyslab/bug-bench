#!/usr/bin/env bash
# does not work on ubuntu 20.04 or higher
./bootstrap
export FORCE_UNSAFE_CONFIGURE=1 && ./configure
if [[ $1 == "sparrow" ]]; then
  $SMAKE_BIN --init
  $SMAKE_BIN CFLAGS="-Wno-error -g"
  mv sparrow/*.i $SMAKE_OUT
elif [[ $1 == "infer" ]]; then
  echo "not implemented yet"
  exit 1
else
  echo "Unknown build target"
  exit 1
fi

