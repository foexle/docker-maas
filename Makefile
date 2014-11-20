SHELL := /bin/bash

project_repo=lp:maas
image_name=ubuntudesign/maas

define HELP_TEXT
Docker maas image
===

Usage:

> make run    # Run the maas webservice on port 5240

> make clean  # Delete the downloaded docker maas image
> make build  # Rebuild the image fromt the Dockerfile

endef

help:
	$(info ${HELP_TEXT})

run:
	docker run --tty --interactive --publish 5240:5240 ${image_name}

build:
	rm -rf maas/
	bzr branch ${project_repo}
	docker build -t ${image_name} .
	rm -rf maas/

clean:
	rm -rf maas/
	docker rmi -f ${image_name}
