FROM lsiobase/ubuntu-gui

# set version label
ARG BUILD_DATE
ARG VERSION
ARG CALIBRE_VERSION
LABEL build_version="Linuxserver.io version:- ${VERSION} Build-date:- ${BUILD_DATE}"
LABEL maintainer="aptalca"

ENV APPNAME="calibre"

RUN \
 echo "**** install runtime packages ****" && \
 apt-get update && \
 apt-get install -y \
	ImageMagick && \
 echo "**** install calibre ****" && \
 wget -nv -O- https://raw.githubusercontent.com/kovidgoyal/calibre/master/setup/linux-installer.py \
  | sudo python -c "import sys; main=lambda:sys.stderr.write('Download failed\n'); \
  exec(sys.stdin.read()); main()" && \
 echo "**** cleanup ****" && \
 apt-get clean && \
 rm -rf \
	/tmp/* \
	/var/lib/apt/lists/* \
	/var/tmp/*

# add local files
COPY root/ /
