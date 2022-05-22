#!/bin/bash

BIN=$SRC/$PROGRAM/tools/rgb2ycbcr

case $1 in
  n1) $BIN -c zip -r0 -h2 -v0 $INPUT/sample.tif temp;;
  n2) $BIN -c zip -r0 -h0 -v2 $INPUT/sample.tif temp;;
esac
