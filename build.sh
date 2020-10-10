#!/usr/bin/env bash

NAME=matt/build-xen
REV=ubuntu-2004-spice

sudo docker build -t $NAME:$REV .
