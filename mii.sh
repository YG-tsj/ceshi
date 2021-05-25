#!/bin/bash

sudo echo 'DNS=9.9.9.9 8.8.8.8'>> /etc/systemd/resolved.conf
sudo systemctl restart systemd-resolved
sudo systemctl enable systemd-resolved
sudo mv /etc/resolv.conf  /etc/resolv.conf.bak
sudo ln -s /run/systemd/resolve/resolv.conf /etc/
sudo reboot
