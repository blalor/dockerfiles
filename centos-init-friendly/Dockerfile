FROM centos
MAINTAINER Brian Lalor <blalor@bravo5.org>

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

RUN (echo -n "blalor/centos:init-friendly " ; date -u) >> /.docker
