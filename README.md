Docker maas image
===

Build the Maas docker image

Usage
---

``` bash
> make maas-image                  # Create maas image
> IMAGE_NAME=fish make maas-image  # Create image, but call it "fish"
> make start                       # Start the container
> make stop                        # Stop the container
```

After running `make start`, visit <http://localhost:5240> and login with:

```
usernames: "admin" or "test"
password: test
```
