SHELL := /bin/bash

project_repo=lp:maas
container_name=maas
image_name=ubuntudesign/maas

define HELP_TEXT
Docker maas image
===

Usage:

> make run    # Run the maas webservice on port 5240
> make stop   # Stop the container
> make start  # Resume the container
> make clean  # Delete the downloaded docker maas image

endef

help:
	$(info ${HELP_TEXT})

run:
	docker rm -f ${container_name}
	docker run --tty --interactive --publish 5240:5240 ${image_name}

build:
	docker build -t ${image_name} .

clean:
	docker rmi -f ${image_name}
