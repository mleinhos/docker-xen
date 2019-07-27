#!/usr/bin/env bash

NAME=matt/build-xen
REV=ubuntu-1804-spice

sudo docker build -t $NAME:$REV .
