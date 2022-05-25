#!/bin/bash

BIN=$SRC/$OPENJPEG_c02f14/applications/codec/j2k_to_image
HERE=$(dirname $0)

case $1 in
  n1) $BIN -i $HERE/CVE-2016-8691.j2k -o out.bmp;;
  n2) $BIN -i $HERE/CVE-2016-8692.j2k -o out.bmp;;
esac
