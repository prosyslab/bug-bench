#!/usr/bin/env bash
ln -s ${which gcc-8} /usr/bin/gcc
CFLAGS="-DFORTIFY_SOURCE=2 -fno-omit-frame-pointer -ggdb -Wno-error" ./configure --disable-shared --disable-gdb --disable-libdecnumber --disable-readline --disable-sim LIBS='-ldl -lutil'
MAKE_PARAMS=-j10
CFLAGS="-ldl -lutil" 
CXXFLAGS="-ldl -lutil -g" 
LDFLAGS="-ldl -lutil" 

if [[ $1 == "sparrow" ]]; then
  $SMAKE_BIN --init
  $SMAKE_BIN $MAKE_PARAMS
  mv sparrow/*.i $SMAKE_OUT
elif [[ $1 == "infer" ]]; then
  echo "not implemented yet"
  exit 1
else
  echo "Unknown build target"
  exit 1
fi
