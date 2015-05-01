#!/bin/bash

mkdir -p /config/config
ln -s /config/config /nobody/.config/calibre
chown -R nobody:users /config
su -c "calibre-server --with-library=/config --port 8081 &" -s /bin/sh nobody
