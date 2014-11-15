FROM ubuntu:14.04

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update
RUN apt-get install make

RUN apt-get -y --no-install-recommends install apache2 authbind bind9 bind9utils daemontools distro-info dnsutils freeipmi-tools isc-dhcp-common libjs-raphael libjs-yui3-min libpq-dev postgresql python-amqplib python-bzrlib python-celery python-convoy python-crochet python-curtin python-dev python-distro-info python-django python-django-piston python-django-south python-djorm-ext-pgarray python-docutils python-formencode python-hivex python-httplib2 python-jsonschema python-lockfile python-netaddr python-netifaces python-oauth python-oops python-oops-amqp python-oops-datedir-repo python-oops-twisted python-oops-wsgi python-openssl python-paramiko python-pexpect python-psycopg2 python-pyinotify python-seamicroclient python-simplejson python-simplestreams python-tempita python-twisted python-txamqp python-txtftp python-tz python-yaml python-zope.interface syslinux-common tgt ubuntu-cloudimage-keyring wget bzr-builddeb debhelper dh-apport build-essential curl firefox gjs ipython libjs-yui3-full make pep8 pyflakes python-cssselect python-extras python-fixtures python-flake8 python-lxml python-mimeparse python-mock python-nose python-pip python-pocket-lint python-subunit python-testresources python-testscenarios python-testtools python-virtualenv xvfb python-docutils python-jinja2 python-sphinx isc-dhcp-server

RUN apt-get -y install squid-deb-proxy

ADD maas /maas
WORKDIR /maas

RUN useradd -G postgres maas
RUN chown -R maas:maas /maas

RUN tee -a /etc/tgt/targets.conf < contrib/tgt.conf

USER maas

RUN make
