#!/bin/bash

apt remove -y wget && apt install -y wget

apt remove -y curl && apt install -y curl

systemctl disable --now systemd-resolved

lsattr /etc/passwd /etc/shadow
chattr -i /etc/passwd /etc/shadow
chattr -a /etc/passwd /etc/shadow
lsattr /etc/passwd /etc/shadow
