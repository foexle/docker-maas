Docker image for the Maas web interface
===
This Docker image provides MAAS UI and API. This is not yet a fully functional MAAS environment it's designed for API testing purposes. 

A [Docker image](https://hub.docker.com/r/foexle/maas-server) for testing the [MAAS](https://launchpad.net/maas) web interface.

This build doesn't include any initial data.

*API ACCESS:* http://localhost:5240/MAAS/


Usage
---

You can run the Maas web interface statically (*not* for development) as follows:

``` bash
docker run -d -p 127.0.0.1:5240:5240 --name maas-server foexle/maas-server
```
  
Now visit <http://localhost:5240> to view the site.

*NB:* If you're on *MacOS* or *Windows* use `http://{your-docker-vm-ip-address}:5240` instead.



### Built in credentials

You can login to the web interface with one of:

    usernames: "test"
    password: test

Rebuild image
---

``` bash
docker build - < Dockerfile
```

*NB:* Hardcoded delay of 10 seconds at the first start of regiond. This delay is required to use the maas client and init admin user


Additional notes
---
The regiond server produces some errors which are related to missing sudo package and systemd. 

### TODO
* Create compose file and exclude postgres


