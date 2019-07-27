docker-xen
===========

Usage:

```
$ docker run -i --rm -v $(pwd):/source starlabio/xen build-deb.sh
```
or
```
$ docker run -i --rm -v $(pwd):/source -w /source matt-xen:ubuntu-1804-spice ./build-deb.sh
```
