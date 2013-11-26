FROM centos
MAINTAINER Brian Lalor <blalor@bravo5.org>

RUN echo "NETWORKING=yes" > /etc/sysconfig/network

## basic packages. cronie requires /usr/sbin/sendmail, and I've observed both
## sendmail and postfix being installed as a dependency.  Specify it explicitly
## and suppress the service
RUN yum -y install which cronie logrotate postfix
RUN chkconfig postfix off

RUN yum clean all && rm -rf /var/tmp/yum-root*
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

RUN (echo -n "blalor/centos:init-friendly" ; date -u) >> /.docker
