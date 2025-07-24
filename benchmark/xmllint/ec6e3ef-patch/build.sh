#!/bin/bash
SMAKE_I_DIR="sparrow/xmllint"
BIN_PATH="xmllint"

if [[ $1 == "sparrow" ]]; then
	./autogen.sh \
		--with-http=no \
		--with-python=no \
		--with-lzma=yes \
		--with-threads=no \
		--disable-shared
	$SMAKE_BIN --init
	$SMAKE_BIN all
	cp $SMAKE_I_DIR/*.i $SMAKE_OUT
elif [[ $1 == "haechi" ]]; then
	export CC=$GCLANG_BIN
	export CXX=$GCLANG_BIN++
	./autogen.sh \
		--with-http=no \
		--with-python=no \
		--with-lzma=yes \
		--with-threads=no \
		--disable-shared
	export CFLAGS="$CFLAGS -include ../magma_src/canary.h -DMAGMA_ENABLE_CANARIES \
                 -g -O0 -fno-discard-value-names -Xclang -disable-O0-optnone"

	$CC $CFLAGS -c ../magma_src/canary.c -o ../magma_src/canary.o

	export LIBS="$LIBS /src/magma_src/canary.o -lstdc++"

	$SMAKE_BIN --init
	$SMAKE_BIN all
	cp $SMAKE_I_DIR/*.i $SMAKE_OUT

	$GET_BC_BIN $BIN_PATH &&
		llvm-dis -o $BIN_PATH.ll $BIN_PATH.bc &&
		opt -mem2reg -S -o $HAECHI_OUT/$(basename $BIN_PATH).ll $BIN_PATH.ll
else
	echo "Unknown build target"
	exit 1
fi
