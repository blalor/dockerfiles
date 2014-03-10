#!/bin/bash

set -e -x -u

cd /tmp/src

groupadd -g 600 znc
useradd -g znc -u 600 -r znc

yum install -y znc

mv program-znc.conf /etc/supervisor.d/
mv logrotate-znc.conf /etc/logrotate.d/znc
mv logstash-forwarder-znc.json /etc/logstash-forwarder.d/znc.json

mv reorganize_irc_logs.sh /etc/cron.daily/

mkdir -p /var/lib/znc/configs
mv znc.conf /var/lib/znc/configs/znc.conf

chown -R znc:znc /var/lib/znc

## because lazy
runuser -s /bin/bash znc -c "znc --datadir /var/lib/znc --makepem"

## @todo https://github.com/jreese/znc-push
## @todo too big!
yum install -y znc-devel gcc-c++
curl -L -o colloquy.cpp http://github.com/MrLenin/colloquypush/raw/master/znc/colloquy.cpp
znc-buildmod colloquy.cpp
mv colloquy.so /usr/lib64/znc/

## cleanup
cd /
yum clean all
rm -rf /var/tmp/yum-root* /tmp/src
