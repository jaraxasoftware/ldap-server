FROM openjdk:8-jdk-alpine

MAINTAINER Jaraxa Software

ENV LDAP_PORT 10389
ENV LDAPS_PORT 10636

VOLUME /tmp
VOLUME /keystore

ARG JAR_FILE
COPY ${JAR_FILE} app.jar

EXPOSE ${LDAP_PORT} ${LDAPS_PORT}

ENTRYPOINT java -Djava.security.egd=file:/dev/./urandom -jar /app.jar -sp ${LDAPS_PORT} -p ${LDAP_PORT}
