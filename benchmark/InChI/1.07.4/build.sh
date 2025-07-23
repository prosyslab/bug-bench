#!/usr/bin/env bash
export C_COMPILER=$CC
export CPP_COMPILER=$CXX
export LINKER=$CXX
cd INCHI-1-SRC
find . -type f -exec sed -i 's/clang/$CC/g' {} +
find . -type f -exec sed -i 's/clang++/$CXX/g' {} +

if [[ $1 == "sparrow" ]]; then
  export CMAKE_EXPORT_COMPILE_COMMANDS=1
  cmake INCHI_EXE/inchi-1/src
  $SMAKE_DIR/scmake
  cp sparrow/*/*/*.i $SMAKE_OUT
elif [[ $1 == "infer" ]]; then
  $INFER_BIN capture -- make
  cp -r infer-out $OUT
elif [[ $1 == "haechi" ]]; then
  export CC="$GCLANG_BIN -static -fno-discard-value-names -O0 -g"
  export CXX="$GCLANG_BIN -static -fno-discard-value-names -O0 -g"
  export CMAKE_EXPORT_COMPILE_COMMANDS=1
  cmake INCHI_EXE/inchi-1/src
  $SMAKE_DIR/scmake
  cp sparrow/*/*/*.i $SMAKE_OUT
  echo 1 | ./cmake_build_tool.sh

  cd ../CMake_build/cli_build/bin/
  EXT_TARGET=inchi-1
  $GET_BC_BIN $EXT_TARGET &&
  llvm-dis -o $EXT_TARGET.ll $EXT_TARGET.bc &&
  opt -mem2reg -S -o $HAECHI_OUT/$(basename $EXT_TARGET).ll $EXT_TARGET.ll
else
  echo "Unknown build target"
  exit 1
fi
