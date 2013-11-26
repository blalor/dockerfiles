FROM blalor/centos:java
MAINTAINER Brian Lalor <blalor@bravo5.org>

VOLUME ["/logstash"]

ADD https://download.elasticsearch.org/logstash/logstash/logstash-1.2.2-flatjar.jar /usr/share/logstash/logstash.jar
ADD logstash.conf.in /etc/

ADD launch.sh /launch.sh

## RUN yum clean all && rm -rf /var/tmp/yum-root*
RUN (echo -n "blalor/logstash " ; date -u) >> /.docker

CMD ["/launch.sh"]
