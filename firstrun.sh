#!/bin/bash

echo -e "calibre\ncalibre" | passwd root
service xrdp restart
calibre-server --with-library=/config &
