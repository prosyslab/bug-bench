#!/bin/bash
CONFIG_OPTIONS="--disable-shared"
export CFLAGS="-Wno-error"

MAKE_PARAMS="-j"
SMAKE_I_DIR="sparrow"
BIN_PATH="tcpdump"

if [[ $1 == "sparrow" ]]; then
  ./configure $CONFIG_OPTIONS
  $SMAKE_BIN --init
  $SMAKE_BIN $MAKE_PARAMS
  cp $SMAKE_I_DIR/$BIN_PATH/*.i $SMAKE_OUT
  
  # tcpdump uses api from libpcap. Thus we need some relevant files from libpcap
  git clone https://github.com/the-tcpdump-group/libpcap.git
  cd libpcap
  git checkout libpcap-1.8.1
  ./configure
  yes | $SMAKE_BIN --init
  $SMAKE_BIN $MAKE_PARAMS
  cp sparrow/libpcap.a/pcap.o.i $SMAKE_OUT
  cp sparrow/libpcap.a/savefile.o.i $SMAKE_OUT
elif [[ $1 == "haechi" ]]; then
  export CC=$GCLANG_BIN
  export CFLAGS="$CFLAGS -fno-discard-value-names -O0 -Xclang -disable-O0-optnone -g"
  ./configure $CONFIG_OPTIONS

  $SMAKE_BIN --init
  $SMAKE_BIN $MAKE_PARAMS
  cp $SMAKE_I_DIR/$BIN_PATH/*.i $SMAKE_OUT

  # tcpdump uses api from libpcap. Thus we need some relevant files from libpcap
  git clone https://github.com/the-tcpdump-group/libpcap.git
  cd libpcap
  git checkout libpcap-1.8.1
  ./configure
  yes | $SMAKE_BIN --init
  $SMAKE_BIN $MAKE_PARAMS
  cp sparrow/libpcap.a/pcap.o.i $SMAKE_OUT
  cp sparrow/libpcap.a/savefile.o.i $SMAKE_OUT
  cd ..

  $GET_BC_BIN libpcap/pcap.o &&
    llvm-dis -o pcap.ll libpcap/pcap.o.bc &&
    opt -mem2reg -S -o pcap.ll pcap.ll 
  $GET_BC_BIN libpcap/savefile.o &&
    llvm-dis -o savefile.ll libpcap/savefile.o.bc &&
    opt -mem2reg -S -o savefile.ll savefile.ll 
  $GET_BC_BIN $BIN_PATH &&
    llvm-dis -o $BIN_PATH.ll $BIN_PATH.bc &&
    opt -mem2reg -S -o $BIN_PATH.ll $BIN_PATH.ll
  llvm-link-13 -S pcap.ll savefile.ll $BIN_PATH.ll -o $HAECHI_OUT/tcpdump-4.9.2.ll
else
  echo "Unknown build target"
  exit 1
fi
