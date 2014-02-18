FROM blalor/centos-supervised

RUN yum install -y bitlbee && \
    sed -i -e '/User /s/^# //g' /etc/bitlbee/bitlbee.conf

EXPOSE 6667
VOLUME /var/lib/bitlbee/

ADD program-bitlbee.conf /etc/supervisor.d/
ADD launch-bitlbee.sh /usr/local/bin/
