FROM centos
MAINTAINER Brian Lalor <blalor@bravo5.org>

## the volume mapped to this location needs to be writable by the elasticsearch
## user/group which appears to have ids 498/499. Ownership set on launch by
## launch.sh
VOLUME ["/var/lib/elasticsearch"]
EXPOSE 9200 9300

RUN echo "NETWORKING=yes" > /etc/sysconfig/network

## remove default upstart stuff that isn't needed.  tty.conf respawns a process
## that always fails.
RUN rm -f \
    /etc/init/tty.conf \
    /etc/init/start-ttys.conf \
    /etc/init/control-alt-delete.conf \
    /etc/init/plymouth-shutdown.conf \
    /etc/init/quit-plymouth.conf \
    /etc/init/prefdm.conf \
    /etc/init/serial.conf \
    /etc/init/splash-manager.conf

## basic packages. cronie requires /usr/sbin/sendmail, and I've observed both
## sendmail and postfix being installed as a dependency.  Specify it explicitly
## and suppress the service
RUN yum -y install java-1.7.0-openjdk which cronie logrotate postfix
RUN chkconfig postfix off

ADD elasticsearch-logrotate.conf /etc/logrotate.d/elasticsearch
ADD elasticsearch-logging.yml /etc/elasticsearch/logging.yml
ADD elasticsearch.yml /etc/elasticsearch/elasticsearch.yml

ADD es.rpm /tmp/es.rpm
RUN yum -y localinstall --nogpgcheck /tmp/es.rpm

## cleanup
RUN yum clean all
RUN rm -rf /var/tmp/yum-root* /tmp/es.rpm

ADD launch.sh /launch.sh

RUN date -u >> /.docker

CMD ["/launch.sh"]
