#!/bin/bash

service xrdp restart
calibre-server --with-library=/config &
