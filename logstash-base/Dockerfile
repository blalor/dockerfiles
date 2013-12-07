FROM blalor/java:1.7.0
MAINTAINER Brian Lalor <blalor@bravo5.org>

ADD https://download.elasticsearch.org/logstash/logstash/logstash-1.2.2-flatjar.jar /usr/share/logstash/logstash.jar

RUN rpm -ivh http://download.fedoraproject.org/pub/epel/6/i386/epel-release-6-8.noarch.rpm
RUN yum install -y zeromq

## grrr logstash/java/ruby
RUN cd /usr/lib64 && ln -s libzmq.so.1 libzmq.so

RUN yum clean all && rm -rf /var/tmp/yum-root*
RUN (echo -n "blalor/logstash:1.2.2" ; date -u) >> /.docker
