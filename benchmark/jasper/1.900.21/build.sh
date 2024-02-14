#!/usr/bin/env bash

autoreconf -i
./configure

MAKE_PARAMS="-j"

if [[ $1 == "sparrow" ]]; then
  autoreconf -i
  ./configure
  $SMAKE_BIN --init
  $SMAKE_BIN $MAKE_PARAMS
  for f in $(find /src/jasper/sparrow/src -name "*.i" -not -path '*/\.*'); do
    mv $f $SMAKE_OUT/$(basename $f)
  done
elif [[ $1 == "infer" ]]; then
  autoreconf -i
  ./configure
  $INFER_BIN capture -- make $MAKE_PARAMS
  cp -r infer-out $OUT
elif [[ $1 == "haechi" ]]; then
  export CC=$GCLANG_BIN
  export CFLAGS="-fno-discard-value-names -O0 -Xclang -disable-O0-optnone -g"
  autoreconf -i
  ./configure

  $SMAKE_BIN --init
  $SMAKE_BIN $MAKE_PARAMS
  for f in $(find /src/jasper/sparrow/src -name "*.i" -not -path '*/\.*'); do
    mv $f $SMAKE_OUT/$(basename $f)
  done

  EXT_TARGET=src/appl/jasper.o
  $GET_BC_BIN $EXT_TARGET &&
    llvm-dis -o $EXT_TARGET.ll $EXT_TARGET.bc &&
    opt -mem2reg -S -o $EXT_TARGET.ll $EXT_TARGET.ll

  ## link other sources in lib/ to a single file
  for f in $(find src/libjasper -type f -not -path '*/\.*'); do
    $GET_BC_BIN $f &&
      llvm-dis -o $f.ll $f.bc &&
      opt -mem2reg -S -o src/$(basename $f).ll $f.ll
  done
  llvm-link-13 -S src/*.ll $EXT_TARGET.ll -o $HAECHI_OUT/jasper-1.900.21.ll

else
  make -j
fi
