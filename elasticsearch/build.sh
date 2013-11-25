#!/bin/bash

set -x
set -e

es_ver="0.90.7"

[ -e "es.rpm" ] || wget -Oes.rpm https://download.elasticsearch.org/elasticsearch/elasticsearch/elasticsearch-${es_ver}.noarch.rpm

docker build .
