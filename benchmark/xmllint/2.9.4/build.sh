#!/bin/bash
SMAKE_I_DIR="sparrow/xmllint"
BIN_PATH="xmllint"

if [[ $1 == "sparrow" ]]; then
  ./autogen.sh --disable-shared
  $SMAKE_BIN --init
  $SMAKE_BIN -j
  cp $SMAKE_I_DIR/*.i $SMAKE_OUT
elif [[ $1 == "infer" ]]; then
  ./autogen.sh --disable-shared
  $INFER_BIN capture -- $MAKE_PARAMS
  mv infer-out $OUT
elif [[ $1 == "haechi" ]]; then
  export CC=$GCLANG_BIN
  export CFLAGS="$CFLAGS -fno-discard-value-names -O0 -Xclang -disable-O0-optnone -g"
  ./autogen.sh --disable-shared
  
  $SMAKE_BIN --init
  $SMAKE_BIN -j
  cp $SMAKE_I_DIR/*.i $SMAKE_OUT

  $GET_BC_BIN $BIN_PATH &&
  llvm-dis -o $BIN_PATH.ll $BIN_PATH.bc &&
  opt -mem2reg -S -o $HAECHI_OUT/$(basename $BIN_PATH).ll $BIN_PATH.ll
else
  echo "Unknown build target"
  exit 1
fi