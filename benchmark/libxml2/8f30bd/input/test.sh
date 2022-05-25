#!/bin/bash

XML_INCLUDE=$SRC/$LIBXML2_8f30bd/include
XML_LIBS=$SRC/$LIBXML2_8f30bd/.libs
HERE=$(dirname $0)
SRC=$HERE/poc.c
BIN=$HERE/poc

case $1 in
  n1)
    clang -I $XML_INCLUDE -L $XML_LIBS -lxml2 $SRC -o $BIN
    LD_PRELOAD=$LD_PRELOAD:$XML_LIBS/libxml2.so LD_LIBRARY_PATH=$LD_LIBRARY_PATH:$XML_LIBS/ $BIN
    ;;
esac
