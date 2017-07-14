# vi: set ft=dockerfile :

FROM centos:6

RUN yum install -y epel-release && \
    curl -L -o /etc/yum.repos.d/bigtop.repo http://www.apache.org/dist/bigtop/stable/repos/centos6/bigtop.repo && \
    yum install -y --nogpgcheck http://ymu.dl.osdn.jp/linux-ha/66141/pacemaker-repo-1.1.14-1.1.el6.x86_64.rpm && \
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
    ./configure --enable-corosync --enable-zookeeper --enable-sheepfs --enable-diskvnodes && \
    LANG=C make -j8 rpm
