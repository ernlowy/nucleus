FROM ubuntu:20.04

RUN rm /bin/sh && ln -s /bin/bash /bin/sh

RUN apt-get update && \
    DEBIAN_FRONTEND=noninteractive apt-get -qq install git sudo emacs\
     && apt-get clean

WORKDIR /tmp
RUN git clone https://github.com/ernlowy/nucleus.git
WORKDIR nucleus
RUN bash install.sh
ENV PATH="${PATH}:/root/bin/"

CMD /bin/bash
