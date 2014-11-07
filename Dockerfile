FROM ubuntu:trusty
MAINTAINER Tatsuro Hisamori <medianetworks@gmail.com>

ENV DEBIAN_FRONTEND noninteractive

# update, curl
RUN apt-get update && apt-get -y upgrade
RUN apt-get -y install curl 

# fluentd
RUN curl -O http://packages.treasure-data.com/debian/RPM-GPG-KEY-td-agent && apt-key add RPM-GPG-KEY-td-agent && rm RPM-GPG-KEY-td-agent
RUN curl -L http://toolbelt.treasuredata.com/sh/install-ubuntu-trusty-td-agent2.sh | sh

# fix certfile
RUN rm -f /opt/td-agent/embedded/ssl/cert.pem
ADD cacert.pem /opt/td-agent/embedded/ssl/cert.pem
