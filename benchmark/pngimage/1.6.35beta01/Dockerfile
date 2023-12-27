FROM prosyslab/bug-bench-base

RUN apt-get -y update
RUN apt-get -y install wget autoconf texinfo unzip

ENV PROGRAM=pngimage

RUN mkdir $PROGRAM

ENV URL=https://github.com/glennrp/libpng/archive/refs/tags/v1.6.35beta01.zip

RUN wget $URL
RUN unzip v1.6.35beta01.zip
RUN mv libpng-1.6.35beta01/* $PROGRAM


COPY build.sh $SRC

WORKDIR $PROGRAM
RUN sed -i 's/return ((int)(crc != png_ptr->crc));/return (0);/g' pngrutil.c