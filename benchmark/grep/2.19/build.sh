#!/usr/bin/env bash

./configure

if [[ $1 == "sparrow" ]]; then
  $SMAKE_BIN --init
  $SMAKE_BIN -j
  cp sparrow/src/grep/*.i $SMAKE_OUT
elif [[ $1 == "infer" ]]; then
  $INFER_BIN capture -- make -j
  mv infer-out $OUT
elif [[ $1 == "haechi" ]]; then
  export CC=$GCLANG_BIN
  export CFLAGS="-fno-discard-value-names -O0 -Xclang -disable-O0-optnone -g"
  ./configure
  make -j
  EXT_TARGET=src/grep
  $GET_BC_BIN $EXT_TARGET &&
  llvm-dis -o $EXT_TARGET.ll $EXT_TARGET.bc &&
  opt -mem2reg -S -o $HAECHI_OUT/$(basename $EXT_TARGET).ll $EXT_TARGET.ll
else
  echo "Unknown build target"
  exit 1
fi
