Docker maas image
===

Build the Maas docker image

Usage
---

``` bash
> make build  # Create the "maas" image
> make start  # Start the container
> make stop   # Stop the container
```

After running `make start`, visit <http://localhost:5240> and login with:

```
usernames: "admin" or "test"
password: test
```
