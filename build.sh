#!/usr/bin/env bash

NAME=matt/build-xen
REV=bios

sudo docker build -t $NAME:$REV .
