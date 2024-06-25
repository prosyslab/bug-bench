#!/bin/bash
export CFLAGS="-Wno-error"

MAKE_PARAMS="-j"
SMAKE_I_DIR="sparrow/nasm"
BIN_PATH="nasm"

if [[ $1 == "sparrow" ]]; then
  ./configure
  $SMAKE_BIN --init
  $SMAKE_BIN $MAKE_PARAMS
  for f in $(find $SMAKE_I_DIR -name "*.i" -not -path '*/\.*'); do
    mv $f $SMAKE_OUT/$(basename $f)
  done
elif [[ $1 == "haechi" ]]; then
  export CC=$GCLANG_BIN
  export CFLAGS="$CFLAGS -fno-discard-value-names -O0 -Xclang -disable-O0-optnone -g"
  ./configure

  $SMAKE_BIN --init
  $SMAKE_BIN $MAKE_PARAMS
  for f in $(find $SMAKE_I_DIR -name "*.i" -not -path '*/\.*'); do
    mv $f $SMAKE_OUT/$(basename $f)
  done
  $GET_BC_BIN $BIN_PATH &&
    llvm-dis -o $BIN_PATH.ll $BIN_PATH.bc &&
    opt -mem2reg -S -o $HAECHI_OUT/$(basename $BIN_PATH).ll $BIN_PATH.ll
else
  echo "Unknown build target"
  exit 1
fi
