#!/bin/bash

dnf install -y wget unzip

cd /opt || exit 1

if [[ ! -f /usr/local/bin/packer ]]; then
    wget https://releases.hashicorp.com/packer/1.6.0/packer_1.6.0_linux_amd64.zip
    unzip packer_1.6.0_linux_amd64.zip -d /usr/local/bin
    packer version
fi

firewall-cmd --add-port=10080-10090/tcp
firewall-cmd --permanent --add-port=10080-10090/tcp
