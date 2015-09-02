FROM debian:jessie
MAINTAINER Johnathan Froeming <johnathan@kodokux.com>
ADD etc /etc
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && \
	apt-get upgrade -y && \
	apt-get install -y ca-certificates inotify-tools nano pwgen supervisor unrar \
	unzip wget curl git build-essential libssl-dev libffi-dev python-dev && \
	apt-get clean && \
	echo -n > /var/lib/apt/extended_states

RUN curl -kL https://raw.github.com/pypa/pip/master/contrib/get-pip.py | python
RUN mkdir /config /data
RUN useradd -u 500 core
ADD config /config
RUN chmod +x /config/loop
CMD /config/loop
