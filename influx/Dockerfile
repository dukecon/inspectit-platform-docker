FROM influxdb:1.2.4

COPY influxdb.conf /config/influxdb.conf
COPY run.sh /run.sh

ENV PRE_CREATE_DB NONE
ENV CONFIG_FILE /config/influxdb.conf

RUN chmod +x /run.sh

EXPOSE 8086
EXPOSE 8083

CMD ["/run.sh"]