#!/bin/sh

LDAPSERVER_HOME="/opt/ldap-server"

java \
-Djava.security.egd=file:/dev/./urandom \
-Djavax.net.debug=${DEBUG} \
-jar ${LDAPSERVER_HOME}/lib/ldap-server.jar \
--ssl-port ${LDAPS_PORT} \
--ssl-keystore-file ${LDAPSERVER_HOME}/certs/${KEYSTORE_FILE} \
--ssl-keystore-password ${KEYSTORE_PASSWORD} \
--name ${LDAP_SERVER_NAME} \
--bind 0.0.0.0 \
${LDAPSERVER_HOME}/ldif/${LDIF_FILE}
