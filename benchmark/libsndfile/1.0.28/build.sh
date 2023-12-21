#!/usr/bin/env bash

if [[ $1 == "sparrow" ]]; then
  ./autogen.sh
  ./configure
  $SMAKE_BIN --init
  $SMAKE_BIN -j
  cp sparrow/src/.libs/libsndfile.so.1.0.28/*.i $SMAKE_OUT
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
  cp sparrow/src/.libs/libsndfile.so.1.0.28/*.i $SMAKE_OUT

  $GET_BC_BIN src/.libs/libsndfile.so.1.0.28 &&
    llvm-dis -o libsndfile.so.1.0.28.ll src/.libs/libsndfile.so.1.0.28.bc &&
    opt -mem2reg -S -o $HAECHI_OUT/libsndfile-1.0.28.ll libsndfile.so.1.0.28.ll

else
  echo "Unknown build target"
  exit 1
fi
