FROM centos
MAINTAINER Brian Lalor <blalor@bravo5.org>

EXPOSE 80

ADD https://download.elasticsearch.org/kibana/kibana/kibana-3.0.0milestone4.tar.gz /tmp/kibana.tgz
RUN tar -xz --strip-components=1 -C /var/www/html/ -f /tmp/kibana-3.0.0milestone4.tar.gz

RUN yum -y install httpd
RUN chkconfig httpd on

ADD launch.sh /launch.sh

RUN yum clean all && rm -rf /var/tmp/yum-root* /tmp/kibana.tgz
RUN (echo -n "blalor/logstash " ; date -u) >> /.docker

CMD ["/launch.sh"]
