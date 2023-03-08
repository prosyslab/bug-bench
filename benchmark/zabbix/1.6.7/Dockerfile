FROM prosyslab/bug-bench-base

RUN apt-get -y update
RUN apt-get -y install libmysql++-dev

ENV PROGRAM=zabbix

ENV URL=https://github.com/prosyslab-warehouse/zabbix-1.6.7
ENV GIT_REPO_NAME=zabbix-1.6.7

RUN git clone $URL
RUN mv $GIT_REPO_NAME $PROGRAM

COPY build.sh $SRC

WORKDIR $PROGRAM
