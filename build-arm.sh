#!/bin/sh -eux

##
## Cross-compile Xen for ARM
##

#export ARCH=arm64
export CROSS_COMPILE=aarch64-linux-gnu-

export FETCHER=/bin/false
export WGET=/bin/false

export CONCURRENCY_LEVEL=`grep "model name" /proc/cpuinfo | wc -l`

# You cannot compile ARM bins alongside x86
make distclean

# Need to run configure for tools but not for Xen proper
./configure --with-platform=efi \
            --disable-stubdom

make -j $CONCURRENCY_LEVEL dist-xen XEN_TARGET_ARCH=arm64

#
# Figure this out; it may be easier to compile tools on the board
#
make -j $CONCURRENCY_LEVEL tools    XEN_TARGET_ARCH=arm64
