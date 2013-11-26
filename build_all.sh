#!/bin/bash

set -e

cd $( dirname $0 )

docker build -t blalor/centos:init-friendly centos-init-friendly
docker build -t blalor/centos:java centos-java
docker build -t blalor/elasticsearch elasticsearch
docker build -t blalor/kibana kibana
docker build -t blalor/logstash logstash