#!/bin/bash
CONFIG_OPTIONS="--disable-shared --static-mp4box"
export CFLAGS="-Wno-error"

MAKE_PARAMS="-j"
BIN_PATH="MP4Box"

if [[ $1 == "sparrow" ]]; then
  ./configure $CONFIG_OPTIONS
  $SMAKE_BIN --init
  $SMAKE_BIN $MAKE_PARAMS
  cp -r sparrow/bin/gcc/MP4Box/*.i $SMAKE_OUT
  rm -rf $SMAKE_OUT/*.odf_parse.o.i *.color.o.i
elif [[ $1 == "infer" ]]; then
  ./configure $CONFIG_OPTIONS
  $INFER_BIN capture -- $MAKE_PARAMS
  mv infer-out $OUT
elif [[ $1 == "haechi" ]]; then
  export CC=$GCLANG_BIN
  export CFLAGS="$CFLAGS -fno-discard-value-names -O0 -Xclang -disable-O0-optnone -g"
  ./configure $CONFIG_OPTIONS
  
  $SMAKE_BIN --init
  $SMAKE_BIN $MAKE_PARAMS
  cp -r sparrow/bin/gcc/MP4Box/*.i $SMAKE_OUT
  rm -rf $SMAKE_OUT/*.odf_parse.o.i *.color.o.i

  $GET_BC_BIN bin/gcc/$BIN_PATH &&
  llvm-dis -o $BIN_PATH.ll bin/gcc/$BIN_PATH.bc &&
  opt -mem2reg -S -o $HAECHI_OUT/$(basename $BIN_PATH).ll $BIN_PATH.ll
else
  echo "Unknown build target"
  exit 1
fi

