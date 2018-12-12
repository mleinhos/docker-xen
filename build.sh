#!/usr/bin/env bash

NAME=matt/build-xen
REV=spice

sudo docker build -t $NAME:$REV .
