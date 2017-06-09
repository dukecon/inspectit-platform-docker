#!/usr/bin/env bash

set -m

exec ./run.sh &

until $(curl --output /dev/null --silent --head --fail http://localhost:3000); do
  printf "waiting for Grafana server to come up\n"
  sleep 1
done

curl 'http://admin:admin@localhost:3000/api/datasources' -X POST -H 'Content-Type: application/json;charset=UTF-8' --data-binary '{"name":"inspectit-influx","type":"influxdb","url":"http://influx:8086","access":"proxy","isDefault":true,"database":"inspectit"}'
curl 'http://admin:admin@localhost:3000/api/datasources' -X POST -H 'Content-Type: application/json;charset=UTF-8' --data-binary '{"name":"cadvisor-influx","type":"influxdb","url":"http://influx:8086","access":"proxy","isDefault":true,"database":"cadvisor"}'

fg