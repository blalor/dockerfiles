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

. /etc/sysconfig/elasticsearch

## set ownership on /var/lib/elasticsearch
chown -R ${ES_USER}:${ES_USER} ${DATA_DIR}

_launch_cmd="/usr/share/elasticsearch/bin/elasticsearch -f"
_launch_cmd="${_launch_cmd} -Des.default.path.home=${ES_HOME}"
_launch_cmd="${_launch_cmd} -Des.default.path.logs=${LOG_DIR}"
_launch_cmd="${_launch_cmd} -Des.default.path.data=${DATA_DIR}"
_launch_cmd="${_launch_cmd} -Des.default.path.work=${WORK_DIR}"
_launch_cmd="${_launch_cmd} -Des.default.path.conf=${CONF_DIR}"

exec runuser -s /bin/bash ${ES_USER} -c "${_launch_cmd}"
