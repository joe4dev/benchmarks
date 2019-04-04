#!/usr/bin/env bash

# Abort if any command fails
set -e

apt-get update
apt-get install -y build-essential

cd /opt
wget http://brick.kernel.dk/snaps/fio-3.13.tar.gz
tar xzf fio-3.13.tar.gz
cd fio-3.13
./configure
make
make install
