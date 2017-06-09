#!/bin/bash

set -m
INFLUX_HOST="localhost"
INFLUX_API_PORT="8086"
API_URL="http://${INFLUX_HOST}:${INFLUX_API_PORT}"

echo "=> Starting InfluxDB ..."
exec influxd -config=${CONFIG_FILE} &

if [ "${PRE_CREATE_DB}" == "NONE" ]; then
    unset PRE_CREATE_DB
fi

# Pre create database on the initiation of the container
if [ -n "${PRE_CREATE_DB}" ]; then
    echo "=> About to create the following database: ${PRE_CREATE_DB}"
    if [ -f "/data/.pre_db_created" ]; then
        echo "=> Database had been created before, skipping ..."
    else
        arr=$(echo ${PRE_CREATE_DB} | tr "," "\n")
        echo arr
        #wait for the startup of influxdb
        RET=1
        while [[ RET -ne 0 ]]; do
            echo "=> Waiting for confirmation of InfluxDB service startup ..."
            sleep 3
            curl -k ${API_URL}/ping 2> /dev/null
            RET=$?
        done

        for x in $arr
        do
            echo "=> Creating database: ${x}"
            influx -host=${INFLUX_HOST} -port=${INFLUX_API_PORT} -execute="create database \"${x}\""
        done

        touch "/data/.pre_db_created"
    fi
else
    echo "=> No database need to be pre-created"
fi

fg