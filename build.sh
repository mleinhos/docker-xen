#!/usr/bin/env bash

NAME=matt/build-xen:latest
REV=latest

sudo docker build -t $NAME:$REV .

