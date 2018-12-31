#!/bin/sh -eux

export FETCHER=/bin/false
export WGET=/bin/false

export CONCURRENCY_LEVEL=`grep "model name" /proc/cpuinfo | wc -l`

./configure --disable-docs --disable-stubdom \
	--disable-qemu-traditional \
	--with-system-qemu \
	--with-system-seabios=/usr/share/seabios/bios.bin


make -j $CONCURRENCY_LEVEL debball
