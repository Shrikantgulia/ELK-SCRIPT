#!/bin/sh
sudo apt-get update
sudo apt-get install libpcap0.8
sudo curl -L -O https://artifacts.elastic.co/downloads/beats/metricbeat/metricbeat-5.4.1-amd64.deb
     dpkg -i metricbeat-5.4.1-amd64.deb
cd /etc/metricbeat
ls
echo put ip
read my_message
echo "metricbeat.modules:
- module: system
  metricsets:
    - cpu
    - load
    - core
    - diskio
    - filesystem
    - fsstat
    - memory
    - network
    - process
    - socket
  enabled: true
  period: 10s
  processes: ['.*']
output.logstash:
  enabled: true
  hosts: ["${my_message}:5044"]" > /etc/metricbeat/metricbeat.yml
#etc.

