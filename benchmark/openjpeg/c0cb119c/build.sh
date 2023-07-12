#!/usr/bin/env bash

PWD="$(pwd)"
SMAKE_DIR="$(dirname "${SMAKE_BIN}")"
SCMAKE_BIN="${SMAKE_DIR}/scmake"
CMAKE_EXPORT_COMPILE_COMMANDS=1

if [[ $1 == "sparrow" ]]; then
  mkdir build
  cd build; cmake .. -DCMAKE_BUILD_TYPE=Release && make; make install
  cp $SCMAKE_BIN $SMAKE_DIR/scmake_cpy
  SCMAKE_CPY=$SMAKE_DIR/scmake_cpy
  sed 's#file_p.relative_to(cwd).parent / out_name#out_name#g' $SCMAKE_CPY > $SMAKE_DIR/scmake_tmp 
  python3 $SMAKE_DIR/scmake_tmp && mv ./sparrow/*.i $SMAKE_OUT/
  rm $SMAKE_DIR/scmake_tmp
  rm $SCMAKE_CPY
elif [[ $1 == "infer" ]]; then
  echo "not implemented"
elif [[ $1 == "haechi" ]]; then
  echo "not implemented"
else
  make -j
fi
