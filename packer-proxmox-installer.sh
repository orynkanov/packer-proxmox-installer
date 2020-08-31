#!/bin/bash

if [[ ! -f /etc/centos-release ]]; then
    echo OS not CentOS. This script only for CentOS!
    exit 1
fi

OSVER=$(grep -o '[0-9]' /etc/centos-release | head -n1)
if [[ $OSVER -eq 7 ]]; then
    yum install -y wget unzip
elif [[ $OSVER -eq 8 ]]; then
    dnf install -y wget unzip
fi

cd /opt || exit 1

if [[ ! -f /usr/local/bin/packer ]]; then
    wget https://releases.hashicorp.com/packer/1.6.2/packer_1.6.2_linux_amd64.zip
    unzip packer_1.6.2_linux_amd64.zip -d /usr/local/bin
    packer version
fi

firewall-cmd --add-port=10080-10090/tcp
firewall-cmd --permanent --add-port=10080-10090/tcp
