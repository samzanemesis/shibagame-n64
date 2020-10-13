#!/bin/bash
#todo: cleanup
apt install -y cmake libnusys
mkdir /opt/src/build
cd /opt/src/build
cmake ../src
make