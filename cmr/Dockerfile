FROM inspectit/cmr:1.7.11.94

COPY cmr_config.xml /CMR/config/default.xml

COPY CMR/inspectit-cmr.jar /CMR/inspectit-cmr.jar
COPY CMR/libs/inspectit*.jar /CMR/libs/

COPY startup.sh /CMR/startup.sh
# Solve Networking issue: https://stackoverflow.com/questions/34119722/java-net-inetaddress-java-class-doesnt-resolve-ip-on-alpine-docker-container#
RUN echo 'hosts: files mdns4_minimal [NOTFOUND=return] dns mdns4' >> /etc/nsswitch.conf 

CMD /bin/sh run.sh
