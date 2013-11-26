FROM blalor/elasticsearch:base
MAINTAINER Brian Lalor <blalor@bravo5.org>

## templates
ADD templates/ /etc/elasticsearch/templates/

RUN (echo -n "blalor/elasticsearch:private" ; date -u) >> /.docker

## required? CMD ["/launch.sh"]
