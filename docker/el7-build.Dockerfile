# vi: set ft=dockerfile :

FROM centos:7

RUN yum install -y epel-release && \
    curl -L -o /etc/yum.repos.d/bigtop.repo http://www.apache.org/dist/bigtop/bigtop-1.1.0/repos/centos7/bigtop.repo && \
    yum install -y \
        autoconf automake bc check check-devel gcc gcc-c++ git libtool lsof \
        make net-tools userspace-rcu userspace-rcu-devel yasm yasm-devel \
        fuse fuse-devel corosync corosynclib corosynclib-devel \
        zookeeper-native rpm-build rpmdevtools rpmlint && \
    yum clean all

RUN git clone --depth=1 https://github.com/sheepdog/sheepdog /root/sheepdog
WORKDIR /root/sheepdog
RUN git submodule update --init ./tests/unit/unity && \
    git submodule update --init ./tests/unit/cmock
RUN ./autogen.sh && \
    ./configure --enable-corosync --enable-zookeeper --enable-sheepfs && \
    LANG=C make -j8 rpm
