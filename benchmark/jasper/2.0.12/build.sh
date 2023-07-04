#!/usr/bin/env bash

PWD="$(pwd)"
SMAKE_DIR="$(dirname "${SMAKE_BIN}")"
SCMAKE_BIN="${SMAKE_DIR}/scmake"
CMAKE_EXPORT_COMPILE_COMMANDS=1
mkdir ../tmp
TMPDIR="../tmp"
cmake -G "Unix Makefiles" -H./ -B$TMPDIR -DCMAKE_INSTALL_PREFIX=$TMPDIR

if [[ $1 == "sparrow" ]]; then
  cp $SCMAKE_BIN $SMAKE_DIR/scmake_cpy
  SCMAKE_CPY=$SMAKE_DIR/scmake_cpy
  sed 's#file_p.relative_to(cwd).parent / out_name#out_name#g' $SCMAKE_CPY > $SMAKE_DIR/scmake_tmp 
  cd $TMPDIR; python3 $SMAKE_DIR/scmake_tmp --cmake-out ./cmake-out/ && mv ./sparrow/*.i $SMAKE_OUT; cd ..; rm -rf tmp
  rm $SMAKE_DIR/scmake_tmp
  rm $SCMAKE_CPY
elif [[ $1 == "infer" ]]; then
  echo "not implemented"
elif [[ $1 == "haechi" ]]; then
  echo "not implemented"
else
  make -j
fi
