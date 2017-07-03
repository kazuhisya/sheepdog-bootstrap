# vi: set ft=dockerfile :

FROM centos:7

ENV SHEEPPORT 7000
ENV SHEEPSTORE /store

COPY addon.repo /etc/yum.repos.d/addon.repo
COPY run.sh /root/run.sh
RUN yum install -y zookeeper java-1.8.0-openjdk-headless sheepdog sheepdog-zookeeper nmap-ncat bash-completion

RUN mkdir -p $SHEEPSTORE

EXPOSE $SHEEPPORT
