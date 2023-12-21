#!/usr/bin/env bash

MAKE_PARAMS="-j -C src/ -f scripts/gcc.mak"

if [[ $1 == "sparrow" ]]; then
  $SMAKE_BIN --init
  $SMAKE_BIN $MAKE_PARAMS
  mv sparrow/src/optipng/*.i $SMAKE_OUT
elif [[ $1 == "infer" ]]; then
  $INFER_BIN capture -- make $MAKE_PARAMS
  cp -r infer-out $OUT
elif [[ $1 == "codeql" ]]; then
  $CODEQL_BIN database create --language=cpp --command="make $MAKE_PARAMS" codeql-db
  cp -r codeql-db $OUT
elif [[ $1 == "haechi" ]]; then
  export CC=$GCLANG_BIN
  export CFLAGS="-fno-discard-value-names -O0 -Xclang -disable-O0-optnone -g"

  $SMAKE_BIN --init
  $SMAKE_BIN -j -C src/ -f scripts/clang.mak
  mv sparrow/src/optipng/*.i $SMAKE_OUT

  EXT_TARGET=src/optipng
  $GET_BC_BIN $EXT_TARGET &&
  llvm-dis -o $EXT_TARGET.ll $EXT_TARGET.bc &&
  opt -mem2reg -S -o $HAECHI_OUT/$(basename $EXT_TARGET).ll $EXT_TARGET.ll
else
  echo "Unknown build target"
  exit 1
fi
