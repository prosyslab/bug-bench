FROM prosyslab/bug-bench-base

RUN apt-get -y update
RUN apt-get -y install wget autoconf texinfo \
    git make autoconf automake libtool pkg-config zlib1g-dev \
    liblzma-dev

ENV PROGRAM=xmllint
ENV VERSION=ec6e3ef

RUN mkdir $PROGRAM

ENV URL=https://gitlab.gnome.org/GNOME/libxml2.git
ENV TAG_NAME="ec6e3ef"

RUN git clone $URL $PROGRAM

WORKDIR $PROGRAM
RUN git reset --hard $TAG_NAME

RUN git clone --depth 1 --branch v1.2 https://github.com/HexHive/magma.git /tmp/magma && \
    patch -p1 -i /tmp/magma/targets/libxml2/patches/setup/libxml2.patch && \
    for patch_file in /tmp/magma/targets/libxml2/patches/bugs/*.patch; do \
        name=${patch_file##*/} && \
        name=${name%.patch} && \
        sed "s/%MAGMA_BUG%/$name/g" "$patch_file" | patch -p1; \
    done && \
    mv /tmp/magma/targets/libxml2/src ./src && \
    cp -r /tmp/magma/magma/src ../magma_src && \
    rm -rf /tmp/magma

COPY canary.c $SRC/magma_src/

COPY build.sh $SRC