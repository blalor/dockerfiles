FROM blalor/elasticsearch:0.90.7
MAINTAINER Brian Lalor <blalor@bravo5.org>

## templates
ADD templates/ /etc/elasticsearch/templates/

RUN (echo -n "blalor/elasticsearch:private" ; date -u) >> /.docker

ADD launch.sh /launch.sh
CMD ["/launch.sh"]
