#!/usr/bin/env bash

MAKE_PARAMS="-j"

if [[ $1 == "sparrow" ]]; then
  autoreconf -i
  ./configure
  $SMAKE_BIN --init
  $SMAKE_BIN $MAKE_PARAMS
  mv sparrow/src/appl/*.i $SMAKE_OUT
elif [[ $1 == "infer" ]]; then
  autoreconf -i
  ./configure
  $INFER_BIN capture -- make $MAKE_PARAMS
  cp -r infer-out $OUT
elif [[ $1 == "haechi" ]]; then
  export CC=$GCLANG_BIN
  export CFLAGS="-fno-discard-value-names -O0 -Xclang -disable-O0-optnone"
  autoreconf -i
  ./configure
  make $MAKE_PARAMS
  for f in src/appl/*; do
    $GET_BC_BIN $f &&
      llvm-dis -o $f.ll $f.bc &&
      opt -mem2reg -S -o $HAECHI_OUT/$(basename $f).ll $f.ll
  done
else
  make -j
fi
