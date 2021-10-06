#!/bin/bash

if [ ! $1 ]; then
  make
elif [[ $1 == "infer" ]]; then
  make
  sed 's\$(CXX) -E\/usr/bin/g++ -E\' Makefile >Makefile.tmp
  mv Makefile.tmp Makefile
  make clean
  $INFER_BIN capture -- make
  cp -r infer-out $OUT
else
  echo "Unknown build target"
  exit 1
fi
