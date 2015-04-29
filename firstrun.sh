#!/bin/bash

# Set the correct local time
echo $TZ > /etc/timezone
export DEBCONF_NONINTERACTIVE_SEEN=true DEBIAN_FRONTEND=noninteractive
dpkg-reconfigure tzdata

# Generate root password for RDP
echo -e "calibre\ncalibre" | passwd root
mkdir -p /config/config
ln -s /config/config /root/.config/calibre
service xrdp restart
calibre-server --with-library=/config &
