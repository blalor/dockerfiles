FROM blalor/logstash:base
MAINTAINER Brian Lalor <blalor@bravo5.org>

VOLUME ["/logstash"]

ADD conf/ /etc/logstash/conf/
ADD templates/ /etc/logstash/templates/

ADD launch.sh /launch.sh

RUN (echo -n "blalor/logstash:private" ; date -u) >> /.docker

CMD ["/launch.sh"]
