#!/bin/bash

BIN=$SRC/$LIBTIFF_4_0_6/tools/rgb2ycbcr
HERE=$(dirname $0)

case $1 in
  n1) $BIN -c zip -r0 -h2 -v0 $HERE/sample.tif temp;;
  n2) $BIN -c zip -r0 -h0 -v2 $HERE/sample.tif temp;;
esac
