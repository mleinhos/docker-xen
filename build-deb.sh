#!/bin/sh -eux

export FETCHER=/bin/false
export WGET=/bin/false

export CONCURRENCY_LEVEL=`grep model_name /proc/cpuinfo | wc -l`

./configure --with-platform=bios \
            --disable-stubdom   \
            --with-extra-qemuu-configure-args="--enable-spice --enable-usb-redir"
             

make -j $CONCURRENCY_LEVEL debball
