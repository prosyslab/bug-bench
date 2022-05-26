FROM prosyslab/bug-bench-base:16.04

# basic setting
ENV INPUT=/input
ENV TEST=$INPUT/test.sh

COPY setup.sh /tmp
COPY get-pip.py /tmp
RUN /tmp/setup.sh
