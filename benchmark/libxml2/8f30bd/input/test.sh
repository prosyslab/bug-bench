#!/bin/bash

XML_INCLUDE=$SRC/$PROGRAM/include
XML_LIBS=$SRC/$PROGRAM/.libs
SRC=$INPUT/poc.c
BIN=$INPUT/poc

case $1 in
  n1)
    clang -I $XML_INCLUDE -L $XML_LIBS -lxml2 $SRC -o $BIN
    LD_PRELOAD=$LD_PRELOAD:$XML_LIBS/libxml2.so LD_LIBRARY_PATH=$LD_LIBRARY_PATH:$XML_LIBS/ $BIN
    ;;
esac
