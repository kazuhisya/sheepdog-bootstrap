#!/bin/bash

until echo srvr | nc -w 1 zoo1 2181; do
    >&2 echo "zookeeper is not yet available - waiting..."
    sleep 1
done
mkdir -p ${SHEEPSTORE}/${HOSTNAME}
/usr/sbin/sheep --cluster zookeeper:${ZOO_SERVERS} --log dst=syslog --upgrade ${SHEEPSTORE}/${HOSTNAME} -p ${SHEEPPORT} -n -f
