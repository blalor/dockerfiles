#!/bin/bash

set -e

docker run \
    -d \
    -p 9200 \
    -v /mnt/docker_data/elasticsearch:/var/lib/elasticsearch \
    -name elasticsearch \
    -h elasticsearch \
    blalor/elasticsearch:private

export ES_HOST=$( ifconfig eth0 | grep 'inet addr' | awk '{print $2}' | cut -d: -f2 )
export ES_PORT=$( docker port elasticsearch 9200 | cut -d: -f2 )

## docker run \
##     -d \
##     -e ES_HOST \
##     -e ES_PORT \
##     -p 80 \
##     -name kibana \
##     -h kibana \
##     blalor/kibana

## export KIBANA_PORT=$( docker port kibana 80 | cut -d: -f2 )

##echo "kibana: http://${ES_HOST}:${KIBANA_PORT}/"

docker run \
    -d \
    -P \
    -v /mnt/docker_data/logstash/sincedb:/logstash/sincedb \
    -v        /home/mailfwd-bsd/logstash:/logstash/incoming/mailfwd-bsd:ro \
    -v                          /var/log:/logstash/incoming/docker-host:ro \
    -link elasticsearch:es \
    blalor/logstash:private
