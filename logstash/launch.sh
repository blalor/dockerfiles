#!/bin/bash

## capture non-default environment variables.  This only works for login shells.
## There appears to be no way to set system-wide environment variables on
## redhat.
ENV_FILE="/etc/profile.d/docker.sh"

env | egrep -v '^(HOSTNAME|TERM|PATH|PWD|SHLVL|HOME|container|_)=' | awk -F= '{print $1}' | while read var; do
    echo "${var}='$( eval echo \$${var} )'" >> "${ENV_FILE}"
    echo "export ${var}" >> "${ENV_FILE}"
done

## make sure we've got the required config
if [ -z "${ES_PORT_9200_TCP_ADDR}" ] || [ -z "${ES_PORT_9200_TCP_PORT}" ]; then
    echo "missing ES config; did you link this container to that one?"
    exit 1
fi

## set the host and port for elasticsearch. MUST BE VISIBLE TO THE BROWSER!!
find /etc/logstash/templates -type f | while read src; do
    dest="/etc/logstash/conf/$( basename ${src} )"
    
    sed \
        -e "s#@@ES_HOST@@#${ES_PORT_9200_TCP_ADDR}#g" \
        -e "s#@@ES_PORT@@#${ES_PORT_9200_TCP_PORT}#g" \
        < "${src}" \
        > "${dest}"
done

[ -d /logstash/sincedb ] || mkdir /logstash/sincedb

exec java \
    ${JAVA_OPTS} \
    -jar /usr/share/logstash/logstash.jar \
    agent \
    --config /etc/logstash/conf/
