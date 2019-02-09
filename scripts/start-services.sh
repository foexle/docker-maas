#!/bin/sh
# Start all necessary services

#DB
service postgresql start

#Proxy
/usr/sbin/squid -Y -f /var/lib/maas/maas-proxy.conf

#Reion (API & UI)
/usr/sbin/regiond 
