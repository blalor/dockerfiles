A collection of Dockerfiles

I'm working to get a feel for Docker and ended up with a fairly usable set of
images for running Logstash, Elasticsearch and Kibana as discrete containers.
Checkout [logstash/README.md](logstash/README.md) for details on how to
configure a Logstash container and feed logs into it.

The Kibana and Elasticsearch images are CentOS-based and delegate to
`/sbin/init` for process management.  This isn't ideal because `init` doesn't
exit cleanly on a `docker stop`, but it means you don't have to reinvent the
wheel when using distribution-provided packages that have init.d service
scripts.

* `build_all.sh` will build the entire stack
* `start_all.sh` will start the entire stack (but only once!)
