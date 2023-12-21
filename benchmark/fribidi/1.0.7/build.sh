#!/usr/bin/env bash

if [[ $1 == "sparrow" ]]; then
  ./autogen.sh
  ./configure
  $SMAKE_BIN --init
  $SMAKE_BIN -j
  cp sparrow/bin/.libs/fribidi/*.i $SMAKE_OUT
elif [[ $1 == "infer" ]]; then
  ./autogen.sh
  ./configure
  $INFER_BIN capture -- make -j
  mv infer-out $OUT
elif [[ $1 == "haechi" ]]; then
  export CC=$GCLANG_BIN
  export CFLAGS="-fno-discard-value-names -O0 -Xclang -disable-O0-optnone -g"
  ./autogen.sh
  ./configure
  
  $SMAKE_BIN --init
  $SMAKE_BIN -j
  cp sparrow/bin/.libs/fribidi/*.i $SMAKE_OUT

  EXT_TARGET=bin/fribidi-main.o
  $GET_BC_BIN $EXT_TARGET &&
  llvm-dis -o $EXT_TARGET.ll $EXT_TARGET.bc &&
  opt -mem2reg -S -o $EXT_TARGET.ll $EXT_TARGET.ll

  ## link libfribidi.so.0.4.0 with fribidi-main.o
  $GET_BC_BIN lib/.libs/libfribidi.so.0.4.0 &&
  llvm-dis -o libfribidi.so.0.4.0.ll lib/.libs/libfribidi.so.0.4.0.bc &&
  opt -mem2reg -S -o libfribidi.so.0.4.0.ll libfribidi.so.0.4.0.ll
  llvm-link-13 -S libfribidi.so.0.4.0.ll $EXT_TARGET.ll -o $HAECHI_OUT/fribidi-1.0.7.ll

else
  echo "Unknown build target"
  exit 1
fi
