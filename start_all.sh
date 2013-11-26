#!/bin/bash

set -e

docker run -d -p 9200 -v /mnt/elasticsearch:/var/lib/elasticsearch -name elasticsearch blalor/elasticsearch

export ES_HOST=$( ifconfig eth1 | grep 'inet addr' | awk '{print $2}' | cut -d: -f2 )
export ES_PORT=$( docker port elasticsearch 9200 | cut -d: -f2 )

docker run -d -e ES_HOST -e ES_PORT -p 80 -name kibana blalor/kibana

export KIBANA_PORT=$( docker port kibana 80 | cut -d: -f2 )

echo "kibana: http://${ES_HOST}:${KIBANA_PORT}/"

docker run -d -v /mnt/logstash:/logstash -link elasticsearch:es -name logstash blalor/logstash
