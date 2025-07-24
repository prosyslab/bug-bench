#!/usr/bin/env bash
SMAKE_I_DIR="sparrow/sqlite3"
BIN_PATH="sqlite3"
MAKE_PARAMS="-j"
export CFLAGS="$CFLAGS -DSQLITE_MAX_LENGTH=128000000 \
               -DSQLITE_MAX_SQL_LENGTH=128000000 \
               -DSQLITE_MAX_MEMORY=25000000 \
               -DSQLITE_PRINTF_PRECISION_LIMIT=1048576 \
               -DSQLITE_DEBUG=1 \
               -DSQLITE_MAX_PAGE_COUNT=16384"

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

	./configure --disable-shared --enable-rtree

	export LIBS="$LIBS /src/magma_src/afl_driver.o /src/magma_src/canary.o -lstdc++"
	$SMAKE_BIN --init
	$SMAKE_BIN $MAKE_PARAMS
	$SMAKE_BIN sqlite3.c

	cp $SMAKE_I_DIR/*.i $SMAKE_OUT

	$CC $CFLAGS -I. "test/ossfuzz.c" "./$BIN_PATH.o" -o $BIN_PATH \
		$LDFLAGS $LIBS -pthread -ldl -lm

	$GET_BC_BIN $BIN_PATH &&
		llvm-dis -o $BIN_PATH.ll $BIN_PATH.bc &&
		opt -mem2reg -S -o $HAECHI_OUT/$(basename $BIN_PATH).ll $BIN_PATH.ll
else
	echo "Unknown build target"
	exit 1
fi
