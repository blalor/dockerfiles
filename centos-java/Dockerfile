FROM blalor/centos:init-friendly
MAINTAINER Brian Lalor <blalor@bravo5.org>

RUN yum -y install java-1.7.0-openjdk

RUN yum clean all && rm -rf /var/tmp/yum-root*

RUN (echo -n "blalor/centos:java" ; date -u) >> /.docker
