#!/bin/bash
SMAKE_I_DIR="sparrow"
BIN_PATH="ossfuzz/sndfile_fuzzer"
MAKE_PARAMS="-j"

if [[ $1 == "haechi" ]]; then
	export CC=$GCLANG_BIN
	export CFLAGS="$CFLAGS -include ../magma_src/canary.h -DMAGMA_ENABLE_CANARIES \
                 -g -O0 -fno-discard-value-names -Xclang -disable-O0-optnone"
	export CXX=$GCLANG_BIN++
	export CXXFLAGS="$CXXFLAGS -include ../magma_src/canary.h -DMAGMA_ENABLE_CANARIES -g -O0"

	# Copied from magma/fuzzers/vanilla/build.sh
	$CXX $CXXFLAGS -std=c++11 -c "/src/magma_src/afl_driver.cpp" -fPIC \
		-o "/src/magma_src/afl_driver.o"
	$CC $CFLAGS -c ../magma_src/canary.c -o ../magma_src/canary.o

	export LIBS="$LIBS /src/magma_src/afl_driver.o /src/magma_src/canary.o -lstdc++"
	./autogen.sh
	./configure --disable-shared --enable-ossfuzzers

	$SMAKE_BIN --init
	$SMAKE_BIN $MAKE_PARAMS
	cp $SMAKE_I_DIR/src/*.i $SMAKE_OUT
	cp $SMAKE_I_DIR/ossfuzz/*.ii $SMAKE_OUT

	$GET_BC_BIN $BIN_PATH &&
		llvm-dis -o $BIN_PATH.ll $BIN_PATH.bc &&
		opt -mem2reg -S -o $HAECHI_OUT/$(basename $BIN_PATH).ll $BIN_PATH.ll

else
	echo "Unknown build target"
	exit 1
fi
