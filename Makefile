SHELL := /bin/bash

define HELP_TEXT
Docker maas image
===

Usage:

> make maas-image                  # Create maas image
> IMAGE_NAME=fish make maas-image  # Create image, but call it "fish"
> make run                         # Run the image

endef

# Variables
##

ifeq ($(IMAGE_NAME),)
	IMAGE_NAME=maas
endif

help:
	$(info ${HELP_TEXT})

maas-repo:
	if [ -d maas ]; then \
	    bzr pull --directory maas --overwrite; \
	else \
	    bzr branch lp:maas maas; \
	fi

maas-image:
	${MAKE} maas-repo
	docker build -t ${IMAGE_NAME} .
	# The following commands can't be run from Dockerfile
	# As they need access to /dev/log
	docker run -v /dev/log:/dev/log ${IMAGE_NAME} make syncdb
	docker commit `docker ps -l -q` ${IMAGE_NAME}
	docker run -v /dev/log:/dev/log ${IMAGE_NAME} make sampledata
	docker commit `docker ps -l -q` ${IMAGE_NAME}

start:
	docker run -d -v /dev/log:/dev/log -p 5240:5240 ${IMAGE_NAME} make run
	echo "`docker ps -q`" >> maas-container.id

stop:
	docker stop `cat maas-container.id`
