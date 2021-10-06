#!/bin/bash

if [[ $1 == "n1" ]]; then
  htmldoc --webpage -f out.pdf $SRC/input/htmldoc-poc.html
fi
