
FROM aptalca/docker-webrdp-base

MAINTAINER aptalca

VOLUME ["/config"]

EXPOSE 3389 8080 8081

RUN export DEBCONF_NONINTERACTIVE_SEEN=true DEBIAN_FRONTEND=noninteractive && \
apt-get update && \
apt-get install -y ImageMagick && \
wget -nv -O- https://raw.githubusercontent.com/kovidgoyal/calibre/master/setup/linux-installer.py | sudo python -c "import sys; main=lambda:sys.stderr.write('Download failed\n'); exec(sys.stdin.read()); main()" && \
mkdir -p /etc/my_init.d

ADD autostart /nobody/.config/openbox/autostart
ADD firstrun.sh /etc/my_init.d/firstrun.sh

RUN chown nobody:users /nobody/.config/openbox/autostart && \
chmod +x /etc/my_init.d/firstrun.sh
