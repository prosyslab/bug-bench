#!/usr/bin/env bash

# Collect source for swftocxx,
# which is the utility that triggers CVE-2018-7877
SMAKE_I_DIR="sparrow/util/swftocxx"
BIN_PATH="util/swftocxx"
MAKE_PARAMS="-j"

if [[ $1 == "sparrow" ]]; then
  ./autogen.sh
  ./configure --disable-shared --disable-freetype
  $SMAKE_BIN --init
  $SMAKE_BIN $MAKE_PARAMS
  cp $SMAKE_I_DIR/*.i $SMAKE_OUT
elif [[ $1 == "infer" ]]; then
  ./autogen.sh
  ./configure --disable-freetype
  $INFER_BIN capture -- make
  cp -r infer-out $OUT
elif [[ $1 == "haechi" ]]; then
  export CC=$GCLANG_BIN
  export CFLAGS="-fcommon -fno-discard-value-names -O0 -Xclang -disable-O0-optnone -g"
  ./autogen.sh
  ./configure --disable-shared --disable-freetype
  
  $SMAKE_BIN --init
  $SMAKE_BIN
  cp $SMAKE_I_DIR/*.i $SMAKE_OUT
  
  $GET_BC_BIN $BIN_PATH &&
  llvm-dis -o $BIN_PATH.ll $BIN_PATH.bc &&
  opt -mem2reg -S -o $HAECHI_OUT/libming-0.4.8.ll $BIN_PATH.ll
else
  echo "Unknown build target"
  exit 1
fi
