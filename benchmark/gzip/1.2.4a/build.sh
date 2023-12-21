#!/usr/bin/env bash

SMAKE_I_DIR="sparrow/gzip"
MAKE_PARAMS="-j"

if [[ $1 == "sparrow" ]]; then
  ./configure
  $SMAKE_BIN --init
  $SMAKE_BIN $MAKE_PARAMS
  cp $SMAKE_I_DIR/*.i $SMAKE_OUT
elif [[ $1 == "infer" ]]; then
  ./configure
  $INFER_BIN capture -- $MAKE_PARAMS
  mv infer-out $OUT
elif [[ $1 == "haechi" ]]; then
  export CC=$GCLANG_BIN
  export CFLAGS="-fno-discard-value-names -O0 -Xclang -disable-O0-optnone -g"
  ./configure
  
  $SMAKE_BIN --init
  $SMAKE_BIN $MAKE_PARAMS
  cp $SMAKE_I_DIR/*.i $SMAKE_OUT

  $GET_BC_BIN gzip &&
  llvm-dis -o gzip.ll gzip.bc &&
  opt -mem2reg -S -o $HAECHI_OUT/gzip.ll gzip.ll
else
  echo "Unknown build target"
  exit 1
fi
