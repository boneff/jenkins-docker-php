#!/usr/bin/env bash
# To add this repository please do:

if [ "$(whoami)" != "root" ]; then
    SUDO=sudo
fi




${SUDO} apt-get update
${SUDO} apt-get -y install apt-transport-https ca-certificates curl
${SUDO} wget -O /etc/apt/trusted.gpg.d/php.gpg https://packages.sury.org/php/apt.gpg
${SUDO} sh -c 'echo "deb https://packages.sury.org/php/ $(cat /etc/os-release | grep "VERSION_CODENAME=" | cut -b 18-) main" > /etc/apt/sources.list.d/php.list'
${SUDO} apt-get update