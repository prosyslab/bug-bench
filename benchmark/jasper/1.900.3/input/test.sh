#!/bin/bash

BIN=$SRC/$PROGRAM/src/appl/imginfo 

case $1 in
  n1) $BIN -f $INPUT/CVE-2016-8691.j2k ;;
  n2) $BIN -f $INPUT/CVE-2016-8692.j2k ;;
esac
