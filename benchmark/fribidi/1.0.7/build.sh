#!/usr/bin/env bash

if [[ $1 == "sparrow" ]]; then
  ./autogen.sh
  ./configure
  $SMAKE_BIN --init
  $SMAKE_BIN -j
  cp sparrow/bin/*.i $SMAKE_OUT
elif [[ $1 == "infer" ]]; then
  ./autogen.sh
  ./configure
  $INFER_BIN capture -- make -j
  mv infer-out $OUT
elif [[ $1 == "haechi" ]]; then
  export CC=$GCLANG_BIN
  export CFLAGS="-fno-discard-value-names -O0 -Xclang -disable-O0-optnone"
  ./autogen.sh
  ./configure
  make -j
  for f in bin/*; do
    $GET_BC_BIN $f &&
      llvm-dis -o $f.ll $f.bc &&
      opt -mem2reg -S -o $HAECHI_OUT/$(basename $f).ll $f.ll
  done
else
  echo "Unknown build target"
  exit 1
fi
