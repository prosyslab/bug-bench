#!/usr/bin/env bash

apt-get update
apt-get install -y clang-6.0 python2.7

# make alias
echo "ln -sf /usr/bin/clang-6.0 /usr/bin/clang
ln -sf /usr/bin/python2.7 /usr/bin/python" >> ~/.bashrc

# Install klee and LowFat sanitizer for ExtractFix
TOOLS=/tools
mkdir -p $TOOLS

git clone -b klee-fix https://github.com/prosyslab/klee-bugfix.git $TOOLS/klee
git clone -b symbolize https://github.com/prosyslab/LowFat-bugfix.git $TOOLS/LowFat
