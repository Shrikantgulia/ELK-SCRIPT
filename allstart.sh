#!/bin/sh
sudo service elasticsearch start

sleep 5s
sudo service kibana start
sleep 5s

cd ./logstash-5.4.0/bin
ls
sudo ./logstash -f shrikant.conf



