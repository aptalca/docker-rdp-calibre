
FROM phusion/baseimage:0.9.11

MAINTAINER aptalca

VOLUME ["/config"]

EXPOSE 3389
EXPOSE 8080

RUN echo $TZ > /etc/timezone && \
export DEBCONF_NONINTERACTIVE_SEEN=true DEBIAN_FRONTEND=noninteractive && \
dpkg-reconfigure tzdata && \
apt-get update && \
apt-get install -y \
wget \
lxde \
xrdp && \
echo lxsession -s LXDE -e LXDE > ~/.xsession && \
service xrdp restart && \
wget -nv -O- https://raw.githubusercontent.com/kovidgoyal/calibre/master/setup/linux-installer.py | sudo python -c "import sys; main=lambda:sys.stderr.write('Download failed\n'); exec(sys.stdin.read()); main()" && \
mkdir -p /etc/my_init.d && \
mkdir -p ~/Desktop

ADD calibre-gui.desktop ~/Desktop/calibre-gui.desktop
ADD firstrun.sh /etc/my_init.d/firstrun.sh

RUN chmod a+rw ~/Desktop/calibre-gui.desktop && \
chmod +x /etc/my_init.d/firstrun.sh
