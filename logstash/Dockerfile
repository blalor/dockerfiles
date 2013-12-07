FROM blalor/logstash:1.2.2
MAINTAINER Brian Lalor <blalor@bravo5.org>

VOLUME ["/logstash"]

EXPOSE 2120

ADD conf/ /etc/logstash/conf/
ADD templates/ /etc/logstash/templates/
ADD patterns/ /etc/logstash/patterns/

ADD launch.sh /launch.sh

RUN (echo -n "blalor/logstash:private" ; date -u) >> /.docker

CMD ["/launch.sh"]
