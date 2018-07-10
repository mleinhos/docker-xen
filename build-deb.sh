#!/bin/sh -eux

export FETCHER=/bin/false
export WGET=/bin/false

#./configure --disable-docs --disable-stubdom \
#	--disable-qemu-traditional \
#	--with-system-qemu \
#	--with-platform=efi \
#	--with-system-seabios=/usr/share/seabios/bios.bin

# If spice is enabled, then the build environment (docker?) needs spice packages.

./configure --with-platform=efi \
            --disable-stubdom   \
            --with-extra-qemuu-configure-args="--enable-spice --enable-usb-redir --enable-sdl"
             

make -j 12 debball
