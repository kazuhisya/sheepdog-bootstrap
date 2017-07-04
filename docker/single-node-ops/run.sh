#!/bin/bash

/usr/bin/zookeeper-server start
until echo srvr | nc -w 1 127.0.0.1 2181; do
    >&2 echo "zookeeper is not yet available - waiting..."
    sleep 1
done
/usr/sbin/sheep --cluster zookeeper:127.0.0.1:2181 --log dst=syslog --upgrade $SHEEPSTORE -p $SHEEPPORT -f

