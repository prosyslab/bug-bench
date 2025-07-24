FROM prosyslab/bug-bench-base

RUN apt-get -y update
RUN apt-get -y install wget autoconf texinfo \
    git make autoconf automake libtool

ENV PROGRAM=asn1
ENV VERSION=3bd5319

RUN mkdir $PROGRAM

ENV URL=https://github.com/openssl/openssl.git
ENV TAG_NAME="3bd5319"

RUN git clone $URL $PROGRAM

WORKDIR $PROGRAM
RUN git reset --hard $TAG_NAME

RUN git clone --depth 1 --branch v1.2 https://github.com/HexHive/magma.git /tmp/magma && \
    for patch_file in /tmp/magma/targets/openssl/patches/bugs/*.patch; do \
        name=${patch_file##*/} && \
        name=${name%.patch} && \
        sed "s/%MAGMA_BUG%/$name/g" "$patch_file" | patch -p1; \
    done && \
    cp -r /tmp/magma/magma/src ../magma_src && \
    rm -rf /tmp/magma

COPY canary.c $SRC/magma_src/
COPY afl_driver.cpp $SRC/magma_src/

COPY build.sh $SRC