#!/bin/bash
SMAKE_I_DIR="sparrow"
BIN_PATH="cjpeg"

if [[ $1 == "sparrow" ]]; then
  cmake -G"Unix Makefiles"
  $SMAKE_BIN --init
  $SMAKE_BIN
  cp $SMAKE_I_DIR/*.i $SMAKE_OUT
elif [[ $1 == "infer" ]]; then
  cmake -G"Unix Makefiles"
  $INFER_BIN capture -- $MAKE_PARAMS
  mv infer-out $OUT
elif [[ $1 == "haechi" ]]; then
  export CC=$GCLANG_BIN
  export CFLAGS="$CFLAGS -fno-discard-value-names -O0 -Xclang -disable-O0-optnone"
  cmake -G"Unix Makefiles"
  make
  $GET_BC_BIN $BIN_PATH-static &&
  llvm-dis -o $BIN_PATH.ll $BIN_PATH-static.bc &&
  opt -mem2reg -S -o $HAECHI_OUT/$(basename $BIN_PATH).ll $BIN_PATH.ll
else
  echo "Unknown build target"
  exit 1
fi