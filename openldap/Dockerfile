FROM debian:bullseye

# Mise à jour + install
RUN apt-get update && \
    DEBIAN_FRONTEND=noninteractive apt-get install -y \
    slapd ldap-utils apache2 phpldapadmin && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Copie des fichiers de config
COPY php-config.template.php /etc/phpldapadmin/config.template.php
COPY run.sh /run.sh
RUN chmod +x /run.sh

# Activer SSL
RUN a2enmod ssl && a2ensite default-ssl

CMD ["/run.sh"]
