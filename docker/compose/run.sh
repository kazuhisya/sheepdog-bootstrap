#!/bin/bash

until echo srvr | nc -w 1 zoo1 2181; do
    >&2 echo "zookeeper is not yet available - waiting..."
    sleep 1
done
/usr/sbin/sheep --cluster zookeeper:${ZOO_SERVERS} --log dst=syslog --upgrade ${SHEEPSTORE} -p ${SHEEPPORT} -n -f
