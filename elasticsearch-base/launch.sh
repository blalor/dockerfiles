#!/bin/bash

## capture non-default environment variables.  This only works for login shells.
## There appears to be no way to set system-wide environment variables on
## redhat.
ENV_FILE="/etc/profile.d/docker.sh"

env | egrep -v '^(HOSTNAME|TERM|PATH|PWD|SHLVL|HOME|container|_)=' | awk -F= '{print $1}' | while read var; do
    ## make ES_* variables available to elasticsearch
    if [[ ${var} =~ ^ES_ ]]; then
        echo "${var}='$( eval echo \$${var} )'" >> /etc/sysconfig/elasticsearch
    else
        echo "${var}='$( eval echo \$${var} )'" >> "${ENV_FILE}"
        echo "export ${var}" >> "${ENV_FILE}"
    fi
done

## set ownership on /var/lib/elasticsearch
chown -R elasticsearch:elasticsearch /var/lib/elasticsearch

exec /sbin/init
