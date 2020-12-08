FROM prosyslab/bug-bench-base

RUN apt-get -y update
RUN apt-get -y install tzdata wget

COPY build.sh $SRC
ENV PROGRAM=optipng

RUN mkdir $PROGRAM
WORKDIR $PROGRAM

ENV URL=https://downloads.sourceforge.net/project/optipng/OptiPNG/optipng-0.5.3/optipng-0.5.3.tar.gz

RUN wget $URL
RUN tar -xzvf optipng-0.5.3.tar.gz -C $PROGRAM --strip-components 1
