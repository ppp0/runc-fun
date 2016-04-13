#!/bin/bash -e

mkdir -p ~/golang/src/github.com/opencontainers/
cd ~/golang/src/github.com/opencontainers/
rm -rf runc
git clone https://github.com/opencontainers/runc
cd ./runc
make BUILDTAGS=""
sudo make install
