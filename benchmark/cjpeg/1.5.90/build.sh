#!/bin/bash
SMAKE_I_DIR="sparrow"
BIN_PATH="cjpeg"

if [[ $1 == "sparrow" ]]; then
  export CMAKE_EXPORT_COMPILE_COMMANDS=1
  /smake/scmake --cmake-out tempo
  cp $SMAKE_I_DIR/*.i $SMAKE_OUT
  cd $SMAKE_OUT
  ## We cannot capture sourcers per binary with this project, thus generate all the preprocessed source files.
  ## Remove irrelevant files with main function.
  rm jcstest.i jpegtran.i rdjpgcom.i tjbench.i tjexample.i tjunittest.i wrjpgcom.i djpeg.i
elif [[ $1 == "infer" ]]; then
  cmake -G"Unix Makefiles"
  $INFER_BIN capture -- $MAKE_PARAMS
  mv infer-out $OUT
elif [[ $1 == "haechi" ]]; then
  export CC=$GCLANG_BIN
  export CFLAGS="$CFLAGS -fno-discard-value-names -O0 -Xclang -disable-O0-optnone -g"
  export CMAKE_EXPORT_COMPILE_COMMANDS=1
  cmake -G"Unix Makefiles"
  make
  $GET_BC_BIN $BIN_PATH-static &&
  llvm-dis -o $BIN_PATH.ll $BIN_PATH-static.bc &&
  opt -mem2reg -S -o $HAECHI_OUT/$(basename $BIN_PATH).ll $BIN_PATH.ll

  make clean
  /smake/scmake --cmake-out tempo
  cp $SMAKE_I_DIR/*.i $SMAKE_OUT
  cd $SMAKE_OUT
  ## We cannot capture sourcers per binary with this project, thus generate all the preprocessed source files.
  ## Remove irrelevant files with main function.
  rm jcstest.i jpegtran.i rdjpgcom.i tjbench.i tjexample.i tjunittest.i wrjpgcom.i djpeg.i
else
  echo "Unknown build target"
  exit 1
fi