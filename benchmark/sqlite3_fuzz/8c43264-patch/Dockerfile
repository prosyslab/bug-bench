FROM prosyslab/bug-bench-base

RUN apt-get -y update
RUN apt-get -y install wget \
    make autoconf automake libtool curl tcl zlib1g-dev

ENV PROGRAM=sqlite3_fuzz

RUN mkdir $PROGRAM

ENV URL=https://www.sqlite.org/src/tarball/sqlite.tar.gz?r=8c432642572c8c4b

RUN wget $URL -O sqlite.tar.gz
RUN tar -xzvf sqlite.tar.gz -C $PROGRAM --strip-components 1

WORKDIR $PROGRAM

RUN git clone --depth 1 --branch v1.2 https://github.com/HexHive/magma.git /tmp/magma && \
    patch -p1 -i /tmp/magma/targets/sqlite3/patches/setup/tclexec-ignore-stderr.patch && \
    for patch_file in /tmp/magma/targets/sqlite3/patches/bugs/*.patch; do \
        name=${patch_file##*/} && \
        name=${name%.patch} && \
        sed "s/%MAGMA_BUG%/$name/g" "$patch_file" | patch -p1; \
    done && \
    cp -r /tmp/magma/magma/src ../magma_src && \
    rm -rf /tmp/magma

COPY canary.c $SRC/magma_src/
COPY afl_driver.cpp $SRC/magma_src/

COPY build.sh $SRC