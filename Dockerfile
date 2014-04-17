FROM ubuntu

RUN apt-get update -y
RUN apt-get install git-core make -y
RUN git clone https://github.com/sstephenson/bats.git /tmp/bats && \
    cd /tmp/bats && \
    ./install.sh /usr/local

ADD . /tmp/rr
WORKDIR /tmp/rr
CMD make
