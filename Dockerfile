
FROM aptalca/docker-rdp-base

MAINTAINER aptalca

VOLUME ["/config"]

EXPOSE 3389
EXPOSE 8080

RUN export DEBCONF_NONINTERACTIVE_SEEN=true DEBIAN_FRONTEND=noninteractive && \
echo lxsession -s LXDE -e LXDE > ~/.xsession && \
wget -nv -O- https://raw.githubusercontent.com/kovidgoyal/calibre/master/setup/linux-installer.py | sudo python -c "import sys; main=lambda:sys.stderr.write('Download failed\n'); exec(sys.stdin.read()); main()" && \
mkdir -p /etc/my_init.d && \
mkdir -p /root/Desktop

ADD calibre-gui.desktop /root/Desktop/calibre-gui.desktop
ADD firstrun.sh /etc/my_init.d/firstrun.sh

RUN chmod a+rw /root/Desktop/calibre-gui.desktop && \
chmod +x /etc/my_init.d/firstrun.sh
