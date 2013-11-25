FROM blalor/centos:init-friendly
MAINTAINER Brian Lalor <blalor@bravo5.org>

## basic packages. cronie requires /usr/sbin/sendmail, and I've observed both
## sendmail and postfix being installed as a dependency.  Specify it explicitly
## and suppress the service
RUN yum -y install java-1.7.0-openjdk which cronie logrotate postfix
RUN chkconfig postfix off

RUN yum clean all && rm -rf /var/tmp/yum-root*

RUN (echo -n "blalor/centos:java " ; date -u) >> /.docker
