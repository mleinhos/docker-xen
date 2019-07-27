FROM ubuntu:18.04
MAINTAINER Matt Leinhos <matthew.leinhos@gmail.com>

#RUN sed -e 's:deb h:deb [arch=amd64] h:' -e 's:deb-src h:deb-src [arch=amd64] h:' -i /etc/apt/sources.list && \
#    find /etc/apt/sources.list.d/ -type f -exec sed -e 's:deb h:deb [arch=amd64] h:' -e 's:deb-src h:deb-src [arch=amd64] h:' -i {} \;

# Xen depends
RUN apt-get --quiet --yes update
RUN apt-get --quiet --yes install libx11-dev ocaml-nox ocaml-findlib
RUN apt-get --quiet --yes install ocaml-native-compilers libpixman-1-dev libsystemd-dev
RUN apt-get --quiet --yes install texinfo libnl-3-dev libnl-utils libnl-cli-3-dev libbz2-dev libpci-dev
RUN apt-get --quiet --yes install m4 cmake gcc-multilib build-essential git-core seabios build-essential
RUN apt-get --quiet --yes install libspice-server-dev libspice-server1 libspice-protocol-dev
RUN apt-get --quiet --yes install usbredirserver libusbredirhost-dev libusbredirhost1
RUN apt-get --quiet --yes install pkg-config ca-certificates  wget git libssl-dev software-properties-common bc

# The following line doesn't work on Ubuntu 18.04, so we install the packages below, based on Xen's instructions abut building from source
#RUN	apt-get --quiet --yes build-dep xen
RUN apt-get --quiet --yes install bcc bin86 gawk bridge-utils libcurl4 libcurl4-openssl-dev bzip2 module-init-tools transfig tgif

# This line generates a prompt about timezones, which we cannot answer from docker build process. Just skip it for now. Might impact ability to build of documentation.
#RUN apt-get --quiet --yes install texinfo texlive-latex-base texlive-latex-recommended texlive-fonts-extra texlive-fonts-recommended
RUN apt-get --quiet --yes install pciutils-dev mercurial
RUN apt-get --quiet --yes install make gcc libc6-dev zlib1g-dev python python-dev python-twisted libncurses5-dev patch libvncserver-dev libsdl-dev libjpeg-dev
RUN apt-get --quiet --yes install iasl libbz2-dev e2fslibs-dev git-core uuid-dev ocaml ocaml-findlib libx11-dev bison flex xz-utils libyajl-dev
RUN apt-get --quiet --yes install gettext libpixman-1-dev libaio-dev markdown pandoc
# Additional requirements discovered during build attempts
RUN apt-get --quiet --yes install bin86 bcc lzma lzma-dev liblzma-dev liblzma5

RUN	apt-get clean
RUN    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

ADD build-deb.sh /usr/local/bin/build-deb.sh
