#!/usr/bin/env bash

apt-get update
apt-get install -y clang-6.0 python2.7 libboost-all-dev pkg-config libjsoncpp-dev apt-utils libpthread-stubs0-dev libclang-6.0-dev cmake libz3-dev libncurses5-dev libncursesw5-dev zlib1g-dev bison flex autoconf libtool wget python3-pip

# make alias
ln -sf /usr/bin/clang-6.0 /usr/bin/clang
ln -sf /usr/bin/python2.7 /usr/bin/python
ln -sf /usr/bin/llvm-link-6.0 /usr/bin/llvm-link
ln -sf /usr/bin/llvm-as-6.0 /usr/bin/llvm-as
ln -sf /usr/bin/llvm-config-6.0 /usr/bin/llvm-config
ln -sf /usr/bin/opt-6.0 /usr/bin/opt

# Install pip
python /tmp/get-pip.py

# Install wllvm, coloredlogs, enum
pip install wllvm coloredlogs enum

# Install pyparsing for python3
pip3 install pyparsing==2.4.6 z3

# Github personal access token (`repo` access)
TOKEN=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
git clone https://$TOKEN@github.com/prosyslab/ExtractFix.git /ExtractFix
cd /ExtractFix
git submodule update --init --recursive

# Install klee-uclibc
git clone https://github.com/klee/klee-uclibc.git /klee-uclibc
cd /klee-uclibc
./configure --make-llvm-lib
make -j

# Install minisat
git clone https://github.com/niklasso/minisat.git /tmp/minisat
cd /tmp/minisat
make config
make install

# Install stp
git clone https://github.com/stp/stp.git /tmp/stp
cd /tmp/stp
git checkout tags/2.3.3
mkdir build
cd build
cmake ..
make -j
make install

# Install gperftools for TCmalloc
git clone https://github.com/gperftools/gperftools.git /tmp/gperftools
cd /tmp/gperftools
./autogen.sh
./configure
make -j
make install
