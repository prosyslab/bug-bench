#!/bin/bash
export CFLAGS="-Wno-error"

export PKG_CONFIG_PATH=/usr/lib/x86_64-linux-gnu/pkgconfig:$PKG_CONFIG_PATH

MAKE_PARAMS="-j"
SMAKE_I_DIR="sparrow/gif2tga"
BIN_PATH="gif2tga"

if [[ $1 == "sparrow" ]]; then
  $SMAKE_BIN --init
  $SMAKE_BIN $MAKE_PARAMS
  for f in $(find $SMAKE_I_DIR -name "*.i" -not -path '*/\.*'); do
    mv $f $SMAKE_OUT/$(basename $f)
  done
elif [[ $1 == "haechi" ]]; then
  export CC=$GCLANG_BIN
  export CFLAGS="$CFLAGS -fno-discard-value-names -O0 -Xclang -disable-O0-optnone -g"
  $SMAKE_BIN --init
  $SMAKE_BIN $MAKE_PARAMS
  for f in $(find $SMAKE_I_DIR -name "*.i" -not -path '*/\.*'); do
    mv $f $SMAKE_OUT/$(basename $f)
  done

  EXT_TARGET=gif2tga.o
  $GET_BC_BIN $EXT_TARGET &&
    llvm-dis -o $EXT_TARGET.ll $EXT_TARGET.bc &&
    opt -mem2reg -S -o $EXT_TARGET.ll $EXT_TARGET.ll

  $GET_BC_BIN $BIN_PATH &&
    llvm-dis -o $BIN_PATH.ll $BIN_PATH.bc &&
    opt -mem2reg -S -o $HAECHI_OUT/$(basename $BIN_PATH).ll $BIN_PATH.ll
else
  echo "Unknown build target"
  exit 1
fi
