#!/bin/bash

BIN=$SRC/$PROGRAM/xmllint

case $1 in
  n1) $BIN $INPUT/test_case ;;
esac
