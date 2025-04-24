FROM osixia/phpldapadmin

# Copy phpLDAPadmin config
COPY php-config.php /etc/phpldapadmin/config.php

# Replace default startup script
COPY run.sh /container/run/run.sh
RUN chmod +x /container/run/run.sh

# Enable SSL for Apache (simple self-signed)
#RUN a2enmod ssl && \
#    a2ensite default-ssl
    
