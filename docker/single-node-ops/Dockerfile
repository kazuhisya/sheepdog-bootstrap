# vi: set ft=dockerfile :

FROM centos:7

ENV SHEEPPORT 7000
ENV SHEEPSTORE /store

COPY addon.repo /etc/yum.repos.d/addon.repo
RUN yum install --setopt=tsflags=nodocs -y \
        bash-completion nmap-ncat java-1.8.0-openjdk-headless \
        perl sheepdog sheepdog-zookeeper zookeeper && \
        yum clean all && \
        mkdir -p $SHEEPSTORE
EXPOSE $SHEEPPORT
COPY run.sh /root/run.sh
CMD /bin/bash /root/run.sh
