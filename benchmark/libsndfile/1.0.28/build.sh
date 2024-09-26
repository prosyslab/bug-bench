#!/usr/bin/env bash

SMAKE_I_DIR="sparrow/programs/.libs/sndfile-convert"
BIN_PATH="programs/.libs/sndfile-convert"

if [[ $1 == "sparrow" ]]; then
  ./autogen.sh
  ./configure
  $SMAKE_BIN --init
  $SMAKE_BIN -j
  cp $SMAKE_I_DIR/*.i $SMAKE_OUT
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
  cp $SMAKE_I_DIR/*.i $SMAKE_OUT

  $GET_BC_BIN $BIN_PATH &&
    llvm-dis -o $BIN_PATH.ll $BIN_PATH.bc &&
	opt -mem2reg -S -o $BIN_PATH.ll $BIN_PATH.ll

  ## link other source in .libs/ to a single file
  LIB_PATH="src/.libs/libsndfile.so.1.0.28"
  $GET_BC_BIN $LIB_PATH &&
    llvm-dis -o $LIB_PATH.ll $LIB_PATH.bc &&
    opt -mem2reg -S -o $LIB_PATH.ll $LIB_PATH.ll

  llvm-link-13 -S $LIB_PATH.ll $BIN_PATH.ll -o $HAECHI_OUT/$(basename $BIN_PATH).ll

else
  echo "Unknown build target"
  exit 1
fi
