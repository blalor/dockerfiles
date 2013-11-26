#!/bin/bash

if [ ! -e /.vagrant_init ]; then
    curl http://get.docker.io/gpg | apt-key add -
    
    echo deb http://get.docker.io/ubuntu docker main > /etc/apt/sources.list.d/docker.list
    
    apt-get update
    apt-get -y install linux-image-extra-`uname -r` lxc-docker
    
    date > /.vagrant_init
fi
