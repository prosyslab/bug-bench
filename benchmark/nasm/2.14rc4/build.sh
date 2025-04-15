#!/bin/bash
export CFLAGS="-Wno-error"

MAKE_PARAMS="-j"
SMAKE_I_DIRS="sparrow/asm sparrow/common sparrow/disasm sparrow/macros \
sparrow/nasmlib sparrow/output sparrow/rdoff sparrow/stdlib sparrow/x86"

BIN_PATH="nasm"

if [[ $1 == "sparrow" ]]; then
  ./configure
  $SMAKE_BIN --init
  $SMAKE_BIN $MAKE_PARAMS
  for SMAKE_I_DIR in $SMAKE_I_DIRS; do
    for f in $(find $SMAKE_I_DIR -maxdepth 1 -name "*.i" -not -path '*/\.*'); do
      mv $f $SMAKE_OUT/$(basename $f)
    done
  done
elif [[ $1 == "haechi" ]]; then
  export CC=$GCLANG_BIN
  export CFLAGS="$CFLAGS -fno-discard-value-names -O0 -Xclang -disable-O0-optnone -g"
  ./configure

  $SMAKE_BIN --init
  $SMAKE_BIN $MAKE_PARAMS
  for SMAKE_I_DIR in $SMAKE_I_DIRS; do
    for f in $(find $SMAKE_I_DIR -maxdepth 1 -name "*.i" -not -path '*/\.*'); do
      mv $f $SMAKE_OUT/$(basename $f)
    done
  done
  $GET_BC_BIN $BIN_PATH &&
    llvm-dis -o $BIN_PATH.ll $BIN_PATH.bc &&
    opt -mem2reg -S -o $HAECHI_OUT/$(basename $BIN_PATH).ll $BIN_PATH.ll
else
  echo "Unknown build target"
  exit 1
fi
