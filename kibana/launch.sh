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
if [ -z "${ES_HOST}" ] || [ -z "${ES_PORT}" ]; then
    echo "missing ES config"
    exit 1
fi

## set the host and port for elasticsearch. MUST BE VISIBLE TO THE BROWSER!!
sed -i -r -e "s#(elasticsearch: \").*(\",)#\1http://${ES_HOST}:${ES_PORT}\2#" /var/www/html/config.js

exec /usr/sbin/httpd -D FOREGROUND
