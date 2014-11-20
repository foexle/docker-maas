Docker image for the Maas web interface
===

A Docker image for serving the MAAS web interface for the [MAAS project](https://launchpad.net/maas).

Note this image contains all the MAAS files, so it's tricky to edit them. If you'd like to run the web interface from a locally checked out version of [MAAS](https://launchpad.net/maas, please use [docker-maas-dev](https://github.com/ubuntudesign/docker-maas-dev).

Usage
---

You can run the Maas web interface statically (*not* for development) as follows:

    docker run --detach --name=maas --publish 5240:5240 ubuntudesign/maas
  
Now visit <http://localhost:5240> to view the site.

*NB:* If you're on *MacOS* or *Windows* use `http://{your-docker-vm-ip-address}:5240` instead.

### Built in credentials

You can login to the web interface with one of:

    usernames: "admin" or "test"
    password: test

### Stopping and resuming

    docker stop maas  # stop the container
    docker start maas  # resume the container

### Refreshing the container

If you want to re-run the docker container from scratch, you need to remove the old one first:

    docker rm -f maas
    docker run ...

Debugging
---

To see the full output from the container, you can attach to it:

    docker attach --sig-proxy=false maas
