#!/bin/bash

set -e

cd $( dirname $0 )

docker build -t blalor/java:1.7.0 centos-java

docker build -t blalor/kibana:3.0.0milestone4 kibana

docker build -t blalor/elasticsearch:0.90.7 elasticsearch-base
docker build -t blalor/elasticsearch:private elasticsearch

docker build -t blalor/logstash:1.2.2 logstash-base
docker build -t blalor/logstash:private logstash
