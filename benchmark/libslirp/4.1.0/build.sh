#!/usr/bin/env bash

MAKE_PARAMS="-j"
SMAKE_I_DIR="sparrow/libslirp.a"

if [[ $1 == "sparrow" ]]; then
  $SMAKE_BIN --init
  $SMAKE_BIN $MAKE_PARAMS
  cp $SMAKE_I_DIR/*.i $SMAKE_OUT
elif [[ $1 == "infer" ]]; then
  $INFER_BIN capture -- make $MAKE_PARAMS
  cp -r infer-out $OUT
elif [[ $1 == "haechi" ]]; then
  export CC=$GCLANG_BIN
  export CFLAGS="-fno-discard-value-names -O0 -Xclang -disable-O0-optnone -g"
  make $MAKE_PARAMS
  for f in src/*; do
    $GET_BC_BIN $f &&
      llvm-dis -o $f.ll $f.bc &&
      opt -mem2reg -S -o $f.ll $f.ll
  done
  llvm-link-13 -S src/*.ll -o $HAECHI_OUT/libslirp.ll
else
  echo "Unknown build target"
  exit 1
fi
