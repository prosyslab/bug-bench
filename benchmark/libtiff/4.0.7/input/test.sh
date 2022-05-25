#!/bin/bash

BIN=$SRC/$LIBTIFF_4_0_7/tools/tiffcp

case $1 in
  n1) $BIN -i $INPUT/sample.tif temp;;
esac
