FROM blalor/centos:6.5
MAINTAINER Brian Lalor <blalor@bravo5.org>

RUN yum -y install java-1.7.0-openjdk

RUN yum clean all && rm -rf /var/tmp/yum-root*

RUN (echo -n "blalor/java:1.7.0" ; date -u) >> /.docker
