FROM ubuntu:18.04
MAINTAINER Matt Leinhos <matthew.leinhos@gmail.com>

# Specify amd64 arch across deb sources (?)
RUN sed -e 's:deb h:deb [arch=amd64] h:' -e 's:deb-src h:deb-src [arch=amd64] h:' -i /etc/apt/sources.list && \
    find /etc/apt/sources.list.d/ -type f -exec sed -e 's:deb h:deb [arch=amd64] h:' -e 's:deb-src h:deb-src [arch=amd64] h:' -i {} \;

# Xen depends
# The following line doesn't work on Ubuntu 18.04, so we install the packages below, 
# based on Xen's instructions about building from source

#RUN	apt-get --quiet --yes build-dep xen

RUN apt-get --quiet --fix-missing --yes update

RUN apt-get --quiet --yes install \
bcc bin86 gawk bridge-utils wget libcurl4 libcurl4-openssl-dev \
libssl-dev xz-utils lzma lzma-dev liblzma-dev liblzma5 \
bzip2 module-init-tools transfig tgif \
libx11-dev ocaml ocaml-nox ocaml-findlib \
ocaml-native-compilers libpixman-1-dev libsystemd-dev \
texinfo libnl-3-dev libnl-utils libnl-cli-3-dev libbz2-dev \
m4 make cmake gcc gcc-multilib build-essential \
mercurial git git-core seabios \
libspice-server-dev libspice-server1 libspice-protocol-dev \
usbredirserver libusbredirhost-dev libusbredirhost1 \
pkg-config ca-certificates software-properties-common \
bc libpci-dev pciutils-dev libc6-dev zlib1g-dev \
python python-dev python-twisted \
python3 python3-dev python3-twisted \
libncurses5-dev \
patch libvncserver-dev libsdl-dev libjpeg-dev \
iasl e2fslibs-dev uuid-dev \
bison flex xz-utils libyajl-dev \
gettext libaio-dev markdown pandoc

RUN apt-get clean
RUN rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

ADD build-deb.sh /usr/local/bin/build-deb.sh
