#!/bin/bash

mkdir -p /config/config
ln -s /config/config /nobody/.config/calibre
chown -R nobody:users /config
su -c "calibre-server --with-library=/config &" -s /bin/sh nobody
