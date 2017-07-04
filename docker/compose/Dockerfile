# vi: set ft=dockerfile :

FROM centos:7

ENV SHEEPPORT 7000
ENV SHEEPSTORE /store

COPY addon.repo /etc/yum.repos.d/addon.repo
RUN yum install --setopt=tsflags=nodocs -y \
        bash-completion nmap-ncat \
        perl sheepdog sheepdog-zookeeper && \
    yum clean all && \
    mkdir -p $SHEEPSTORE
EXPOSE $SHEEPPORT
COPY run.sh /root/run.sh
