from quintana/asterisk:latest

MAINTAINER Sylvain Boily <sboily@avencall.com>

# Install Asterisk watchdog module
WORKDIR /usr/src
ADD . /usr/src/asterisk-watchdog-module
WORKDIR /usr/src/asterisk-watchdog-module
RUN make
RUN make install

WORKDIR /root
RUN rm /etc/asterisk/*
ONBUILD ADD watchdog.conf /etc/asterisk/watchdog.conf

RUN rm -rf /usr/src/*
