#!/bin/sh
sudo apt-get update
sudo apt-get install libpcap0.8
sudo curl -L -O https://artifacts.elastic.co/downloads/logstash/logstash-5.4.0.tar.gz
tar -xvzf logstash-5.4.0.tar.gz
touch ./logstash-5.4.0/bin/shrikant.conf
echo 'input {
    beats {
        port => "5044"
    }
}

output {
  elasticsearch {
    hosts => ["localhost:9200"]
    index => 'allmetric1'
  }
  stdout { codec => rubydebug }
}' >> ./logstash-5.4.0/bin/shrikant.conf

echo sleeping 10s
sleep 10s

sudo curl -L -O https://artifacts.elastic.co/downloads/elasticsearch/elasticsearch-5.4.1.deb
     dpkg -i elasticsearch-5.4.1.deb
sudo cat ./elastic.yml > /etc/elasticsearch/elasticsearch.yml
#etc.
echo sleeping 10s
sleep 10s

sudo curl -L -O https://artifacts.elastic.co/downloads/kibana/kibana-5.4.1-amd64.deb
     dpkg -i kibana-5.4.1-amd64.deb


