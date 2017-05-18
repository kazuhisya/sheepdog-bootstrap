#!/bin/bash
docker build -t local/sheepdog:el6 -f ./el6-build.Dockerfile .
docker build -t local/sheepdog:el7 -f ./el7-build.Dockerfile .
