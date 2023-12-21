#!/usr/bin/env bash

MAKE_PARAMS="-j"

if [[ $1 == "sparrow" ]]; then
  ./autogen.sh
  ./configure --disable-freetype
  $SMAKE_BIN --init
  $SMAKE_BIN $MAKE_PARAMS
  mv sparrow/src/.libs/libming.so.1.4.7/*.i $SMAKE_OUT
elif [[ $1 == "infer" ]]; then
  ./autogen.sh
  ./configure --disable-freetype
  $INFER_BIN capture -- make
  cp -r infer-out $OUT
elif [[ $1 == "haechi" ]]; then
  export CC=$GCLANG_BIN
  export CFLAGS="-fcommon -fno-discard-value-names -O0 -Xclang -disable-O0-optnone -g"
  ./autogen.sh
  ./configure --disable-freetype
  
  $SMAKE_BIN --init
  $SMAKE_BIN
  mv sparrow/src/.libs/libming.so.1.4.7/*.i $SMAKE_OUT

  $GET_BC_BIN src/.libs/libming.so.1.4.7 &&
    llvm-dis -o libming.so.1.4.7.ll src/.libs/libming.so.1.4.7.bc &&
    opt -mem2reg -S -o $HAECHI_OUT/libming-0.4.8.ll libming.so.1.4.7.ll
else
  echo "Unknown build target"
  exit 1
fi
