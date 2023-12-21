#!/usr/bin/env bash

MAKE_PARAMS="-j"

if [[ $1 == "sparrow" ]]; then
  ./configure
  $SMAKE_BIN --init
  $SMAKE_BIN $MAKE_PARAMS
  mv sparrow/src/jtag/*.i $SMAKE_OUT
elif [[ $1 == "infer" ]]; then
  ./configure
  $INFER_BIN capture -- make $MAKE_PARAMS
  cp -r infer-out $OUT
elif [[ $1 == "haechi" ]]; then
  export CC=$GCLANG_BIN
  export CFLAGS="-fno-discard-value-names -O0 -Xclang -disable-O0-optnone -g"
  # avoid multiple definition error
  sed -i '340s/.*/\/\/\0/' /src/urjtag/src/svf/svf_flex.c
  ./configure
  
  $SMAKE_BIN --init
  $SMAKE_BIN $MAKE_PARAMS
  mv sparrow/src/jtag/*.i $SMAKE_OUT
  
  EXT_TARGET=src/jtag
  $GET_BC_BIN $EXT_TARGET &&
  llvm-dis -o $EXT_TARGET.ll $EXT_TARGET.bc &&
  opt -mem2reg -S -o $HAECHI_OUT/$(basename $EXT_TARGET).ll $EXT_TARGET.ll
else
  echo "Unknown build target"
  exit 1
fi
