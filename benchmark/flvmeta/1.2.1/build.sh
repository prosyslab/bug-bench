#!/bin/bash
CONFIG_OPTIONS=""
export CFLAGS="-Wno-error"

MAKE_PARAMS="-j"
SMAKE_I_DIR="sparrow/flvmeta/"
BIN_PATH="src/flvmeta"

if [[ $1 == "sparrow" ]]; then
  export CC=$GCLANG_BIN
  cmake .
  cd src
  $SMAKE_BIN --init
  $SMAKE_BIN $MAKE_PARAMS
  cp $SMAKE_I_DIR/*.i $SMAKE_OUT
elif [[ $1 == "haechi" ]]; then
  export CC=$GCLANG_BIN
  export CFLAGS="$CFLAGS -fno-discard-value-names -O0 -Xclang -disable-O0-optnone -g"
  cmake .
  cd src
  $SMAKE_BIN --init
  $SMAKE_BIN $MAKE_PARAMS
  cp $SMAKE_I_DIR/*.i $SMAKE_OUT
  cd ..
  $GET_BC_BIN $BIN_PATH &&
    llvm-dis -o $BIN_PATH.ll $BIN_PATH.bc &&
    opt -mem2reg -S -o $HAECHI_OUT/$(basename $BIN_PATH).ll $BIN_PATH.ll
else
  echo "Unknown build target"
  exit 1
fi
