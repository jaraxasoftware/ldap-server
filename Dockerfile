FROM openjdk:8-jdk-alpine

MAINTAINER Jaraxa Software

ENV LDAP_PORT 10389
ENV LDAPS_PORT 10636

VOLUME /tmp

RUN mkdir -p /opt/ldap-server/ldif
RUN mkdir -p /opt/ldap-server/certs
RUN mkdir -p /opt/ldap-server/lib


ARG JAR_FILE
COPY ${JAR_FILE} app.jar

EXPOSE ${LDAP_PORT} ${LDAPS_PORT}

COPY entrypoint.sh entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
