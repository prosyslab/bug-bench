FROM prosyslab/bug-bench-base

RUN apt-get -y update
RUN apt-get -y install wget git automake pkg-config python-is-python3 libtool autogen \
    make autoconf zlib1g-dev

ENV PROGRAM=libpng_read_fuzzer
ENV VERSION=a37d483

RUN mkdir $PROGRAM

ENV URL=https://github.com/glennrp/libpng.git
ENV TAG_NAME="a37d483"

RUN git clone $URL $PROGRAM

WORKDIR $PROGRAM
RUN git reset --hard $TAG_NAME

RUN git clone --depth 1 --branch v1.2 https://github.com/HexHive/magma.git /tmp/magma && \
    for patch_file in /tmp/magma/targets/libpng/patches/bugs/*.patch; do \
        name=${patch_file##*/} && \
        name=${name%.patch} && \
        sed "s/%MAGMA_BUG%/$name/g" "$patch_file" | patch -p1; \
    done && \
    cp -r /tmp/magma/magma/src ../magma_src && \
    rm -rf /tmp/magma

COPY canary.c $SRC/magma_src/
COPY afl_driver.cpp $SRC/magma_src/

COPY build.sh $SRC