#!/bin/bash
SMAKE_I_DIR="sparrow/fuzz"
BIN_PATH="fuzz/server"

if [[ $1 == "haechi" ]]; then
	export CC=$GCLANG_BIN
	export CFLAGS="$CFLAGS -include /src/magma_src/canary.h -DMAGMA_ENABLE_CANARIES -g -O0"
	export CFLAGS_FOR_CONFIG=$CFLAGS
	export CFLAGS="$CFLAGS -fno-discard-value-names -Xclang -disable-O0-optnone"

	export CXX=$GCLANG_BIN++
	export CXXFLAGS="$CXXFLAGS -include /src/magma_src/canary.h -DMAGMA_ENABLE_CANARIES -g -O0"

	# Copied from magma/fuzzers/vanilla/build.sh
	$CXX $CXXFLAGS -std=c++11 -c "/src/magma_src/afl_driver.cpp" -fPIC \
		-o "/src/magma_src/afl_driver.o"
	$CC $CFLAGS -c /src/magma_src/canary.c -o /src/magma_src/canary.o

	export LIBS="$LIBS /src/magma_src/afl_driver.o /src/magma_src/canary.o -lstdc++"
	export LDLIBS="$LIBS"
	./config --debug enable-fuzz-libfuzzer enable-fuzz-afl disable-tests -DPEDANTIC \
		-DFUZZING_BUILD_MODE_UNSAFE_FOR_PRODUCTION no-shared no-module \
		enable-tls1_3 enable-rc5 enable-md2 enable-ec_nistp_64_gcc_128 enable-ssl3 \
		enable-ssl3-method enable-nextprotoneg enable-weak-ssl-ciphers \
		$CFLAGS_FOR_CONFIG -fno-sanitize=alignment

	$SMAKE_BIN --init
	$SMAKE_BIN -j LDCMD="$CXX $CXXFLAGS"
	cp $SMAKE_I_DIR/*.i $SMAKE_OUT

	$GET_BC_BIN $BIN_PATH &&
		llvm-dis -o $BIN_PATH.ll $BIN_PATH.bc &&
		opt -mem2reg -S -o $HAECHI_OUT/$(basename $BIN_PATH).ll $BIN_PATH.ll
else
	echo "Unknown build target"
	exit 1
fi
