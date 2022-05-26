#!/bin/bash

BIN=$SRC/$LIBTIFF_4_0_7/tools/tiffcp
HERE=$(dirname $0)

case $1 in
  n1) $BIN -i $HERE/sample.tif temp;;
esac
