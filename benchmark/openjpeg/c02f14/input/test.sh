#!/bin/bash

BIN=$SRC/$PROGRAM/applications/codec/j2k_to_image

case $1 in
  n1) $BIN -i $INPUT/CVE-2016-8691.j2k -o out.bmp;;
  n2) $BIN -i $INPUT/CVE-2016-8692.j2k -o out.bmp;;
esac
