#!/bin/bash

if [[ $1 == "p1" ]]; then
  htmldoc --webpage -f out.pdf $SRC/input/htmldoc-poc.html
fi
