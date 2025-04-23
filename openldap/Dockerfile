FROM osixia/openldap:1.5.0

# Install phpLDAPadmin
RUN apt-get update && \
    apt-get install -y phpldapadmin apache2 && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Copy phpLDAPadmin config
COPY php-config.template.php /etc/phpldapadmin/config.template.php

# Replace default startup script
COPY run.sh /container/run/run.sh
RUN chmod +x /container/run/run.sh

# Enable SSL for Apache (simple self-signed)
RUN a2enmod ssl && \
    a2ensite default-ssl
