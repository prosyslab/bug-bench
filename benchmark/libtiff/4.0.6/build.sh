#!/usr/bin/env bash

MAKE_PARAMS="-j"

if [[ $1 == "sparrow" ]]; then
  ./configure
  $SMAKE_BIN --init
  $SMAKE_BIN $MAKE_PARAMS
  mv sparrow/tools/.libs/rgb2ycbcr/*.i $SMAKE_OUT
elif [[ $1 == "haechi" ]]; then
  export CC=$GCLANG_BIN
  export CFLAGS="-fcommon -fno-discard-value-names -O0 -Xclang -disable-O0-optnone -g"
  ./configure
  
  $SMAKE_BIN --init
  $SMAKE_BIN $MAKE_PARAMS
  mv sparrow/tools/.libs/rgb2ycbcr/*.i $SMAKE_OUT
  
  $GET_BC_BIN tools/rgb2ycbcr.o &&
    llvm-dis -o libtiff.ll tools/rgb2ycbcr.o.bc &&
    opt -mem2reg -S -o $HAECHI_OUT/libtiff-4.0.6.ll libtiff.ll
else
  echo "Unknown build target"
  exit 1
fi