FROM ubuntu:20.04

# basic setting
ENV TZ=Asia/Seoul
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ >/etc/timezone

ENV SRC=/src
ENV OUT=/out
RUN mkdir -p $SRC $OUT/smake-out

ENV BUILD=/src/build.sh

# Sparrow
ENV SMAKE_DIR=/smake
ENV SMAKE_BIN=$SMAKE_DIR/smake
ENV SMAKE_OUT=$OUT/smake-out

# Infer
ENV INFER_DIR=/infer
ENV INFER_BIN=$INFER_DIR/infer/bin/infer

# CodeQL
ENV CODEQL_DIR=/codeql
ENV CODEQL_BIN=$CODEQL_DIR/codeql

# for debian package build
ENV DEB_BUILD_OPTIONS="nocheck notest"
RUN sed -Ei 's/^# deb-src /deb-src /' /etc/apt/sources.list
COPY build-deb.sh $SRC

RUN apt-get update && \
    apt-get upgrade -y && \
    apt-get install -y make git gcc tzdata bear dpkg-dev libtinfo5 wget

RUN git clone https://github.com/prosyslab/smake.git

# install llvm-toolchain
COPY install-llvm.sh $SRC
RUN chmod +x $SRC/install-llvm.sh
RUN $SRC/install-llvm.sh

# install gllvm
RUN wget "https://go.dev/dl/go1.20.linux-amd64.tar.gz"
RUN tar -C /usr/local -xzf go1.20.linux-amd64.tar.gz
ENV GOPATH=/go
RUN GO111MODULE=off /usr/local/go/bin/go get github.com/SRI-CSL/gllvm/cmd/...

# Haechi
ENV GLLVM_DIR=/go/bin
ENV GCLANG_BIN=$GLLVM_DIR/gclang
ENV GET_BC_BIN=$GLLVM_DIR/get-bc
ENV HAECHI_OUT=$OUT/haechi-out
RUN mkdir -p $HAECHI_OUT

WORKDIR $SRC
