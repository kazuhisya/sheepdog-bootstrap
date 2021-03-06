# sheepdog-bootstrap

This repository provides unofficial sheepdog verification environment for docker or vagrant.

## Set up an easy-to-use verification environment

For easy operation check, you can use [Docker](https://www.docker.com/) or [Vagrant](https://www.vagrantup.com/).

### Docker version usage

- System requirements
  - [docker](https://docs.docker.com/) version 1.10 or higher
  - [docker-compose](https://docs.docker.com/compose/) version 1.9.0 or higher

List:

- [el6-build.Dockerfile](docker/build/el6-build.Dockerfile)
    - CentOS6.x Build Test (from upstream git)
- [el7-build.Dockerfile](docker/build/el7-build.Dockerfile)
    - CentOS7.x Build Test (from upstream git)
- [docker-compose](docker/compose/)
    - CentOS7.x Docker Compose Version
- [single-node-ops](docker/single-node-ops/)
    - CentOS7.x Docker Single Version


e.g.

```code
$ cd docker
$ docker build -t local/sheepdog:el7 -f ./el7-build.Dockerfile .
```

```code
$ cd docker/compose
$ docker-compose build
$ docker-compose up --scale sheep=32 -d
```

```code
$ cd docker/csingle-node-ops
$ ./build.sh
```

### Vagrant version usage

 - System requirements
   - [vagrant](https://www.vagrantup.com/docs/) version 1.8.1 or higher
   - [vagrant-libvirt](https://github.com/vagrant-libvirt/vagrant-libvirt) version 0.0.32 or higher

List:

- [vagrant/operation](vagrant/operation)
    - Zookeeper x1
    - CentOS7.x Sheepdog x5 (form rpm)
      - rpm from [copr repo](https://copr.fedorainfracloud.org/coprs/khara/sheepdog/)
- [vagrant/tests-centos7](vagrant/tests-centos7)
    - Exec tests for CentOS7.x
- [vagrant/tests-ub1404](vagrant/tests-ub1404)
    - Exec tests for Ubuntu 14.04 LTS (Trusty Tahr)
- [vagrant/tests-ub1604](vagrant/tests-ub1604)
    - Exec tests for Ubuntu 16.04 LTS (Xenial Xerus)


e.g.

```code
$ cd vagrant/operation
$ vagrant up
```



## Disclaimer

- This repository and all files that are included in this, there is no relationship at all with the upstream and vendor.
