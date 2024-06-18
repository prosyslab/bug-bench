#!/bin/bash
CONFIG_OPTIONS=""
export CFLAGS="-Wno-error"

MAKE_PARAMS="-j"
SMAKE_I_DIR="sparrow"
BIN_PATH="src/flvmeta"

if [[ $1 == "sparrow" ]]; then
  cmake .
  /smake/scmake --cmake-out temp
  for f in $(find $SMAKE_I_DIR -name "*.i" -not -path '*/\.*'); do
    mv $f $SMAKE_OUT/$(basename $f)
  done
elif [[ $1 == "haechi" ]]; then
  export CC=$GCLANG_BIN
  export CFLAGS="$CFLAGS -fno-discard-value-names -O0 -Xclang -disable-O0-optnone -g"

  cmake .
  /smake/scmake --cmake-out temp
  for f in $(find $SMAKE_I_DIR -name "*.i" -not -path '*/\.*'); do
    mv $f $SMAKE_OUT/$(basename $f)
  done
  echo "Not finished - can't find flvmeta binary"
  exit 1
  # $GET_BC_BIN $BIN_PATH &&
  #   llvm-dis -o $BIN_PATH.ll $BIN_PATH.bc &&
  #   opt -mem2reg -S -o $HAECHI_OUT/$(basename $BIN_PATH).ll $BIN_PATH.ll
else
  echo "Unknown build target"
  exit 1
fi
