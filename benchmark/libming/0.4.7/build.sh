#!/usr/bin/env bash

MAKE_PARAMS="-j"

if [[ $1 == "sparrow" ]]; then
  ./autogen.sh
  ./configure --disable-freetype
  $SMAKE_BIN --init
  $SMAKE_BIN $MAKE_PARAMS
  mv sparrow/src/*.i $SMAKE_OUT
elif [[ $1 == "infer" ]]; then
  ./autogen.sh
  ./configure --disable-freetype
  $INFER_BIN capture -- make
  cp -r infer-out $OUT
elif [[ $1 == "haechi" ]]; then
  export CC=$GCLANG_BIN
  export CFLAGS="-fno-discard-value-names -O0 -Xclang -disable-O0-optnone"
  ./autogen.sh
  ./configure --disable-freetype
  make $MAKE_PARAMS
  for f in src/*; do
    $GET_BC_BIN $f &&
      llvm-dis -o $f.ll $f.bc &&
      opt -mem2reg -S -o $HAECHI_OUT/$(basename $f).ll $f.ll
  done
else
  echo "Unknown build target"
  exit 1
fi
