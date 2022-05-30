#!/bin/bash

BIN=$SRC/$OPENJPEG_910af7/applications/codec/j2k_to_image
HERE=$(dirname $0)

case $1 in
  n1) $BIN -i $HERE/sample.jp2 -o out.bmp;;
esac
