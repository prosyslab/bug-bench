#!/usr/bin/env bash
CMAKE_EXPORT_COMPILE_COMMANDS=1
SMAKE_DIR="$(dirname "${SMAKE_BIN}")"
SCMAKE_BIN="${SMAKE_DIR}/scmake"
cmake -DCMAKE_BUILD_TYPE=Debug CMakeLists.txt

if [[ $1 == "sparrow" ]]; then
  $SMAKE_BIN --init
  python3 $SCMAKE_BIN 
  mv sparrow/*.i $SMAKE_OUT
elif [[ $1 == "infer" ]]; then
  echo "not implemented yet"
  exit 1
else
  echo "Unknown build target"
  exit 1
fi

