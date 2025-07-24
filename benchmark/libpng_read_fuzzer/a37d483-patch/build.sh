#!/bin/bash
SMAKE_I_DIR="sparrow"
BIN_PATH="contrib/oss-fuzz/libpng_read_fuzzer"

if [[ $1 == "haechi" ]]; then
	export CC=$GCLANG_BIN
	export CFLAGS="$CFLAGS -include ../magma_src/canary.h -DMAGMA_ENABLE_CANARIES -g -O0"
	export CFLAGS="$CFLAGS -fno-discard-value-names -Xclang -disable-O0-optnone"
	export CXX=$GCLANG_BIN++
	export CXXFLAGS="$CXXFLAGS -include ../magma_src/canary.h -DMAGMA_ENABLE_CANARIES -g -O0"
	export CXXFLAGS="$CXXFLAGS -fno-discard-value-names -Xclang -disable-O0-optnone"

	autoreconf -f -i
	./configure --disable-shared

	# Copied from magma/fuzzers/vanilla/build.sh
	$CXX $CXXFLAGS -std=c++11 -c "/src/magma_src/afl_driver.cpp" -fPIC \
		-o "/src/magma_src/afl_driver.o"
	$CC $CFLAGS -c ../magma_src/canary.c -o ../magma_src/canary.o

	$SMAKE_BIN --init
	$SMAKE_BIN -j libpng16.la
	cp $SMAKE_I_DIR/*.i $SMAKE_OUT

	export LIBS="$LIBS /src/magma_src/afl_driver.o /src/magma_src/canary.o -lstdc++"
	$CXX $CXXFLAGS -std=c++11 -I. -include cstdlib \
		$BIN_PATH.cc \
		-o $BIN_PATH \
		.libs/libpng16.a $LIBS -lz

	$GET_BC_BIN $BIN_PATH &&
		llvm-dis -o $BIN_PATH.ll $BIN_PATH.bc &&
		opt -mem2reg -S -o $HAECHI_OUT/$(basename $BIN_PATH).ll $BIN_PATH.ll
else
	echo "Unknown build target"
	exit 1
fi
