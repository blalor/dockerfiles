Example concrete logstash container

Only integrates with Elasticsearch right now, but this is just a demo.  A real
instance would probably have more credentials that shouldn't be public on
GitHub. :-)

## configuration

Put static config files in `conf`; name them so that they're parsed
lexographically.  Put files that need to be pre-processed before Logstash starts
into `templates`.  Modify `launch.sh` to handle any required token substitution.

You'll probably want to process logs that are outside of the Logstash container.
:-)  For this reason `/logstash` is a `VOLUME` that needs to be mounted on a
location accessible to other containers.  By convention in this example, the
Logstash config reads logs from `/logstash/incoming/` and stores its sincedb in
`/logstash/sincedb/`.

## building

    docker build -t blalor/logstash:private .

`build_all.sh` in the root of this project will build the entire stack.

## invocation

First, you'll need an Elasticsearch container:

    docker run -d \
        -p 9200 \
        -v /mnt/elasticsearch:/var/lib/elasticsearch \
        -name elasticsearch \
        blalor/elasticsearch:private

Now, fire up this Logstash container:

    docker run -d \
        -v /mnt/logstash:/logstash \
        -e JAVA_OPTS=-Xmx128M \
        -link elasticsearch:es \
        blalor/logstash:private

You can tweak `JAVA_OPTS` as necessary.

`start_all.sh` in the root of this project will start the entire
Logstash/Elasticsearch/Kibana stack.
