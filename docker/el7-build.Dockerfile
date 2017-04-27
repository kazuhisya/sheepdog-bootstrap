# vi: set ft=dockerfile :

FROM centos:7

RUN yum install -y epel-release && \
        yum groupinstall -y "Base" "Development Tools" && \
        yum install -y corosync corosynclib corosynclib-devel && \
        yum install -y userspace-rcu userspace-rcu-devel yasm yasm-devel && \
        yum install -y fuse fuse-devel && \
        yum install -y rpm-build rpmdevtools rpmlint && \
        curl -L -o /etc/yum.repos.d/bigtop.repo http://www.apache.org/dist/bigtop/bigtop-1.1.0/repos/centos7/bigtop.repo && \
        yum install -y --nogpgcheck zookeeper-native && \
        yum clean all

RUN git clone --depth=1 https://github.com/sheepdog/sheepdog /root/sheepdog
WORKDIR /root/sheepdog
RUN git submodule update --init ./tests/unit/unity && \
    git submodule update --init ./tests/unit/cmock
RUN ./autogen.sh && \
    ./configure --enable-corosync --enable-zookeeper --enable-sheepfs && \
    LANG=C make -j8 rpm
