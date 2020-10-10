#!/usr/bin/env bash

##
## Script to be run from host (not from within docker)
##

NAME=matt/build-xen
REV=ubuntu-2004-spice

sudo docker run -i -v $(pwd):/source -w /source $NAME:$REV ./build-deb.sh
