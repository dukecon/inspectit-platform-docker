FROM grafana/grafana:latest

COPY run_grafana.sh /run_grafana.sh
RUN chmod +x /run_grafana.sh

ENTRYPOINT ["/run_grafana.sh"]