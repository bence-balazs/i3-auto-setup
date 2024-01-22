#!/bin/sh

set -e 

if [ $UID -ne 0 ]; then
    echo "Must be root user to run this script!"
    exit 1
else
    echo "This script will setup a bare i3 VM with some neccessary packages."
fi

apt update -y

apt install sudo -y

sudo apt install i3 xorg lightdm vim xfce4-terminal thunar spice-vdagent spice-webdavd -y

sudo apt remove i3lock -y

sudo reboot now