#!/bin/bash

BIN=$SRC/$PROGRAM/tools/tiffcp

case $1 in
  n1) $BIN -i $INPUT/sample.tif temp;;
esac
