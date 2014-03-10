#!/bin/bash

set -e -x -u

cd /tmp/src

# groupadd -g 600 campervan
# useradd -g campervan -u 600 -r campervan

yum install -y centos-release-SCL

yum install -y ruby193-rubygem-camper_van

mv program-camper_van.conf /etc/supervisor.d/
mv logstash-forwarder-camper_van.json /etc/logstash-forwarder.d/camper_van.json

## cleanup
cd /
yum clean all
rm -rf /var/tmp/yum-root* /tmp/src
