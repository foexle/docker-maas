FROM ubuntu:18.04

ENV DEBIAN_FRONTEND noninteractive
ENV DJANGO_SETTINGS_MODULE maasserver.djangosettings.settings

# Install dependencies
RUN apt-get update && \
    apt-get -y --no-install-recommends install software-properties-common && \
    apt-add-repository -yu ppa:maas/stable && \
    apt-get -y --no-install-recommends install maas && \
    apt-get -y clean && \
    rm -rf /var/cache/apt/archives && \
    rm -rf /var/lib/apt/lists/*

COPY scripts/ /tmp/scripts/
RUN chmod 755 -R /tmp/scripts/


# Init MaaS to add user
RUN service postgresql start && \
    /tmp/scripts/regiond-init-start.sh && \
    /usr/bin/maas init --admin-email test@test.com --admin-password test --admin-username test

# Init other MAAS services
RUN install -d -o proxy -g proxy -m 750 /var/cache/maas-proxy/;  \
    install -d -o proxy -g proxy -m 750 /var/log/maas/proxy/; \
    install -m 750 -o proxy -g proxy -d /var/spool/maas-proxy/; \
    /usr/sbin/squid3 -z -N -f /var/lib/maas/maas-proxy.conf; \
    /bin/rm -f /var/lib/maas/dhcpd.sock; \
    /bin/rm -f /var/lib/maas/dhcpd.conf; \
    /bin/rm -f /var/lib/maas/dhcpd6.conf


EXPOSE 8000/tcp
EXPOSE 5240/tcp


ENTRYPOINT ["/tmp/scripts/start-services.sh"]
