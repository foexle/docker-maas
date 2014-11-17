SHELL := /bin/bash

define HELP_TEXT
Docker maas image
===

Usage:

> make build                     # Create "maas" image
> IMAGE_NAME=me/maas make build  # Create image as "me/maas"
> make start                     # Run the image
> make stop                      # Run the image

endef

# Variables
##

ifeq ($(IMAGE_NAME),)
	IMAGE_NAME=maas
endif

help:
	$(info ${HELP_TEXT})

maas:
	bzr branch lp:maas maas

build:
	${MAKE} clean
	${MAKE} maas
	cp Dockerfile maas/Dockerfile
	cd maas; docker build -t ${IMAGE_NAME} .

start:
	cd maas; docker run -d -v /dev/log:/dev/log -p 5240:5240 ${IMAGE_NAME} > maas-container.id

stop:
	docker stop -t 0 `cat maas/maas-container.id`

clean:
	rm -rf maas
