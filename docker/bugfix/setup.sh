#!/usr/bin/env bash

TOOLS=/tools
mkdir -p $TOOLS

git clone -b klee-fix https://github.com/prosyslab/klee-bugfix.git $TOOLS/klee
git clone -b symbolize https://github.com/prosyslab/LowFat-bugfix.git $TOOLS/LowFat
