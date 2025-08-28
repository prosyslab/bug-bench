#!/bin/bash
CONFIG_OPTIONS="--disable-shared --disable-gdb \
                 --disable-libdecnumber --disable-readline \
                 --disable-sim --disable-ld"
export CFLAGS="-Wno-error"

MAKE_PARAMS="-j"
SMAKE_I_DIR="sparrow/binutils/nm-new"
BIN_PATH="binutils/nm"
sed -i '796,799c\
  x86_64-*-linux-*)\
    targ_defvec=x86_64_elf32_vec\
    targ_selvecs="i386_elf32_vec x86_64_elf32_vec elf32_le_vec elf32_be_vec plugin_vec"' bfd/config.bfd

if [[ $1 == "sparrow" ]]; then
  ./configure $CONFIG_OPTIONS
  $SMAKE_BIN --init
  $SMAKE_BIN $MAKE_PARAMS
  cp $SMAKE_I_DIR/*.i $SMAKE_OUT
elif [[ $1 == "haechi" ]]; then
  export CC=$GCLANG_BIN
  export CFLAGS="$CFLAGS -fno-discard-value-names -O0 -Xclang -disable-O0-optnone -g"
  ./configure $CONFIG_OPTIONS

  $SMAKE_BIN --init
  $SMAKE_BIN $MAKE_PARAMS
  cp $SMAKE_I_DIR/*.i $SMAKE_OUT

  $GET_BC_BIN $BIN_PATH-new &&
  llvm-dis -o $BIN_PATH.ll $BIN_PATH-new.bc &&
  opt -mem2reg -S -o $HAECHI_OUT/$(basename $BIN_PATH).ll $BIN_PATH.ll
else
  echo "Unknown build target"
  exit 1
fi

