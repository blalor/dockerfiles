FROM blalor/java:1.7.0
MAINTAINER Brian Lalor <blalor@bravo5.org>

## the volume mapped to this location needs to be writable by the elasticsearch
## user/group which appears to have ids 498/499. Ownership set on launch by
## launch.sh
VOLUME ["/var/lib/elasticsearch"]
EXPOSE 9200 9300

RUN yum -y localinstall --nogpgcheck \
    https://download.elasticsearch.org/elasticsearch/elasticsearch/elasticsearch-0.90.7.noarch.rpm

ADD elasticsearch-logrotate.conf /etc/logrotate.d/elasticsearch
ADD elasticsearch-logging.yml /etc/elasticsearch/logging.yml
ADD elasticsearch.yml /etc/elasticsearch/elasticsearch.yml

## cleanup
RUN yum clean all && rm -rf /var/tmp/yum-root*

ADD launch.sh /launch.sh

RUN (echo -n "blalor/elasticsearch:0.90.7" ; date -u) >> /.docker

CMD ["/launch.sh"]
