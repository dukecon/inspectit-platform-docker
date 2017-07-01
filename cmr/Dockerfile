FROM inspectit/cmr:1.7.11.94

COPY cmr_config.xml /CMR/config/default.xml

COPY CMR/inspectit-cmr.jar /CMR/inspectit-cmr.jar
COPY CMR/libs/inspectit*.jar /CMR/libs/

COPY startup.sh /CMR/startup.sh

CMD /bin/sh run.sh
