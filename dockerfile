FROM sebp/elk:latest

ENV ES_HOME /opt/elasticsearch
WORKDIR ${ES_HOME}

RUN CONF_DIR=/etc/elasticsearch gosu elasticsearch bin/elasticsearch-plugin \
    install ingest-geoip

COPY 10-syslog.conf /etc/logstash/conf.d/

# Configurations folder, var folder for everything (indexes, logs, kvstore)
VOLUME [ "/var/lib/elasticsearch" ]
