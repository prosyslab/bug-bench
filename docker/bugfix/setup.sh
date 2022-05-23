#!/usr/bin/env bash

apt-get update
apt-get install -y python2.7 clang-6.0

# make alias
echo "alias 'python=python2.7'
alias 'clang=clang-6.0'" >> ~/.bashrc

# Install klee and LowFat sanitizer for ExtractFix
TOOLS=/tools
mkdir -p $TOOLS

git clone -b klee-fix https://github.com/prosyslab/klee-bugfix.git $TOOLS/klee
git clone -b symbolize https://github.com/prosyslab/LowFat-bugfix.git $TOOLS/LowFat
