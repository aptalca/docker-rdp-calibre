FROM lsiobase/guacgui

# set version label
ARG BUILD_DATE
ARG VERSION
ARG CALIBRE_VERSION
LABEL build_version="Linuxserver.io version:- ${VERSION} Build-date:- ${BUILD_DATE}"
LABEL maintainer="aptalca"

ENV TERM="xterm" APPNAME="calibre"
ARG DEBIAN_FRONTEND=noninteractive

RUN \
 echo "**** install runtime packages ****" && \
 apt-get update && \
 apt-get install -y \
	dbus \
	python \
	wget && \
 echo "**** install calibre ****" && \
 wget -nv -O- https://download.calibre-ebook.com/linux-installer.sh | sh /dev/stdin && \
 dbus-uuidgen > /etc/machine-id && \
 echo "**** cleanup ****" && \
 apt-get clean && \
 rm -rf \
	/tmp/* \
	/var/lib/apt/lists/* \
	/var/tmp/*

# add local files
COPY root/ /
