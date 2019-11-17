FROM grafana/grafana:6.5.0
COPY datasources /etc/grafana/provisioning/datasources/
COPY dashboards.yml /etc/grafana/provisioning/dashboards/
COPY dashboards /etc/grafana/dashboards/

ENV GF_AUTH_ANONYMOUS_ENABLED=false
ENV GF_DEFAULT_INSTANCE_NAME=grafana
ENV GF_SECURITY_ADMIN_USER=admin
ENV GF_SECURITY_ADMIN_PASSWORD=admin
ENV GF_PATHS_PROVISIONING=/etc/grafana/provisioning/

USER root