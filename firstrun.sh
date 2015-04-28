#!/bin/bash

echo -e "calibre\ncalibre" | passwd root
mkdir -p /config/config
ln -s /config/config /root/.config/calibre
service xrdp restart
calibre-server --with-library=/config &
