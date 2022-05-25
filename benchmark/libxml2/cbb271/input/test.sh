#!/bin/bash

BIN=$SRC/$LIBXML2_cbb271/xmllint
HERE=$(dirname $0)

case $1 in
  n1) $BIN $HERE/test_case ;;
esac
