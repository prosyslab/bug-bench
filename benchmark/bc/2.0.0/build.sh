#!/usr/bin/env bash

if [[ $1 == "sparrow" ]]; then
  ./configure
  $SMAKE_BIN --init
  $SMAKE_BIN -j
  cp sparrow/bc/bc/*.i $SMAKE_OUT
elif [[ $1 == "infer" ]]; then
  ./configure
  $INFER_BIN capture -- make -j
  mv infer-out $OUT
elif [[ $1 == "codeql" ]]; then
  ./configure
  $CODEQL_BIN database create --language=cpp --command="make" codeql-db
  mv codeql-db $OUT
elif [[ $1 == "haechi" ]]; then
  export CC=$GCLANG_BIN
  export CFLAGS="-fno-discard-value-names -O0 -Xclang -disable-O0-optnone -g"
  EXT_TARGET=bc/bc
  ./configure
  
  $SMAKE_BIN --init
  $SMAKE_BIN -j
  cp sparrow/bc/bc/*.i $SMAKE_OUT

  $GET_BC_BIN $EXT_TARGET &&
  llvm-dis -o $EXT_TARGET.ll $EXT_TARGET.bc &&
  opt -mem2reg -S -o $HAECHI_OUT/$(basename $EXT_TARGET).ll $EXT_TARGET.ll
else
  echo "Unknown build target"
  exit 1
fi
