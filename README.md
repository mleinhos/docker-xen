docker-xen
===========

Build:
```
$ docker build -t matt/build-xen:latest .
```

Usage:

```
$ docker run -i --rm -v $(pwd):/source matt/build-xen:latest build-deb.sh
```
