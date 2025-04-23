#!/usr/bin/env bash
set -e

export LDAP_ORGANISATION="Home Assistant LDAP"
export LDAP_DOMAIN="${LDAP_DOMAIN:-example.org}"
export LDAP_ADMIN_PASSWORD="${LDAP_ADMIN_PASSWORD:-admin}"

# Convert "example.org" => "dc=example,dc=org"
IFS='.' read -ra PARTS <<< "$LDAP_DOMAIN"
dc_string=""
for part in "${PARTS[@]}"; do
  dc_string+="dc=${part},"
done
dc_string="${dc_string%,}"

echo "[INFO] Starting OpenLDAP with domain ${LDAP_DOMAIN}…"
/container/run/startup.sh &

# Génère le fichier phpLDAPadmin config
echo "[INFO] Generating phpLDAPadmin config with bind_id: cn=admin,${dc_string}"
export LDAP_DC="$dc_string"
envsubst < /etc/phpldapadmin/config.template.php > /etc/phpldapadmin/config.php

# Lancer Apache
echo "[INFO] Starting phpLDAPadmin on https://<hass>:6443 …"
service apache2 start

tail -f /dev/null
