#!/usr/bin/env bash
set -e

export LDAP_ORGANISATION="Home Assistant LDAP"
export LDAP_DOMAIN="${LDAP_DOMAIN:-example.org}"
export LDAP_ADMIN_PASSWORD="${LDAP_ADMIN_PASSWORD:-admin}"

echo "[INFO] Starting OpenLDAP with domain ${LDAP_DOMAIN}…"
/container/run/startup.sh &

echo "[INFO] Starting phpLDAPadmin on https://<hass>:6443 …"
service apache2 start

# Keep container running
tail -f /dev/null
