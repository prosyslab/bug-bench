#!/usr/bin/env bash

autoreconf -i
./configure

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
  export CFLAGS="-fno-discard-value-names -O0 -Xclang -disable-O0-optnone -g"
  autoreconf -i
  ./configure
  make $MAKE_PARAMS
  EXT_TARGET=src/appl/jasper.o
  $GET_BC_BIN $EXT_TARGET &&
  llvm-dis -o $EXT_TARGET.ll $EXT_TARGET.bc &&
  opt -mem2reg -S -o $HAECHI_OUT/$(basename $EXT_TARGET).ll $EXT_TARGET.ll
else
  make -j
fi
