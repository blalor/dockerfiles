FROM blalor/centos:java
MAINTAINER Brian Lalor <blalor@bravo5.org>

ADD https://download.elasticsearch.org/logstash/logstash/logstash-1.2.2-flatjar.jar /usr/share/logstash/logstash.jar

## RUN yum clean all && rm -rf /var/tmp/yum-root*
RUN (echo -n "blalor/logstash:base" ; date -u) >> /.docker
