docker-xen
===========

# Build

```
./build.sh
```

# Usage - to build Xen itself



```
$ docker run -i --rm -v $(pwd):/source starlabio/xen build-deb.sh
```

or

```
$ docker run -i --rm -v $(pwd):/source -w /source matt/build-xen:ubuntu-1804-spice ./build-deb.sh
```
