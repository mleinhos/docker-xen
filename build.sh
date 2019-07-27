#!/usr/bin/env bash

NAME=matt/build-xen
REV=arm

sudo docker build -t $NAME:$REV .
