#!/usr/bin/env bash

if [[ $1 == "sparrow" ]]; then
  ./configure
  $SMAKE_BIN --init
  $SMAKE_BIN -j
  cp sparrow/src/a2ps/*.i $SMAKE_OUT
elif [[ $1 == "infer" ]]; then
  ./configure
  $INFER_BIN capture -- make -j
  cp -r infer-out $OUT
elif [[ $1 == "haechi" ]]; then
  export CC=$GCLANG_BIN
  export CFLAGS="-fno-discard-value-names -O0 -Xclang -disable-O0-optnone -g"
  ./configure
  make -j
  $GET_BC_BIN src/a2ps &&
  llvm-dis -o a2ps.ll src/a2ps.bc &&
  opt -mem2reg -S -o $HAECHI_OUT/a2ps.ll a2ps.ll
else
  echo "Unknown build target"
  exit 1
fi
