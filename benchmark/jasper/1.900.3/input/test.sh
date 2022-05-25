#!/bin/bash

BIN=$SRC/$JASPER_1_900_3/src/appl/imginfo 
HERE=$(dirname $0)

case $1 in
  n1) $BIN -f $HERE/CVE-2016-8691.j2k ;;
  n2) $BIN -f $HERE/CVE-2016-8692.j2k ;;
esac
