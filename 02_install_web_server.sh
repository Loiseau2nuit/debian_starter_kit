#!/bin/bash
# widely inspired (and mostly copied) from :
# https://packages.sury.org/php/README.txt
# 'cause when it comes to IT, the lazier the better !
#
if [ "$(whoami)" != "root" ]; then
    SUDO=sudo
fi

${SUDO} apt -y install apt-transport-https lsb-release ca-certificates curl
${SUDO} wget -O /etc/apt/trusted.gpg.d/php.gpg https://packages.sury.org/php/apt.gpg
${SUDO} sh -c 'echo "deb https://packages.sury.org/php/ $(lsb_release -sc) main" > /etc/apt/sources.list.d/php.list'
${SUDO} apt update

## NGINX + MARIADB
${SUDO} apt install -y nginx mariadb-server

## PHP 8.1 : Active support => 25 Nov 2023
${SUDO} apt install -y php8.1-bz2 php8.1-cli php8.1-common php8.1-curl php8.1-fpm php8.1-gd php8.1-imagick php8.1-imap php8.1-intl php8.1-ldap php8.1-mbstring php8.1-mysql php8.1-opcache php8.1-readline php8.1-xml php8.1-zip

## PHP 8.0 : Active support => 26 Nov 2022
${SUDO} apt install -y php8.0-bz2 php8.0-cli php8.0-common php8.0-curl php8.0-fpm php8.0-gd php8.0-imagick php8.0-imap php8.0-intl php8.0-ldap php8.0-mbstring php8.0-mysql php8.0-opcache php8.0-readline php8.0-xml php8.0-zip

## PHP 7.4 : Security fixes only => 28 Nov 2022
${SUDO} apt install -y  php7.4-bz2 php7.4-cli php7.4-common php7.4-curl php7.4-fpm php7.4-gd php7.4-imagick php7.4-imap php7.4-intl php7.4-json php7.4-ldap php7.4-mbstring php7.4-mysql php7.4-opcache php7.4-readline php7.4-xml php7.4-zip

## you can add some more ...
# ${SUDO} apt install -y <previous_version_here>
# but there's a special place in hell for people like you !

## SECURING MYSQL
# as we installed mariadb-server we assume you'll want to secure it a bit
${SUDO} mysql_secure_installation

# Installing adminer (https://adminer.org)
# v 4.8.1 for instance
cd /var/www/html/
${SUDO} wget https://github.com/vrana/adminer/releases/download/v4.8.1/adminer-4.8.1.php -O admnr.php

# then, to configure all that shit, just go to
# https://www.geek17.com/fr/content/debian-11-bullseye-installer-et-configurer-la-derniere-version-de-php-8-fpm-avec-nginx-121
# and follow instructions


## CERTBOT LET'S ENCRYPT
# As we're installing a web server, we also presume that you'll want HTTPS
# comment the following lines if you don't
# source : https://certbot.eff.org/instructions?ws=nginx&os=debiantesting
${SUDO} apt install -y snapd
${SUDO} snap install core
${SUDO} snap refresh core
${SUDO} snap install --classic certbot
${SUDO} ln -s /snap/bin/certbot /usr/bin/certbot
${SUDO} snap set certbot trust-plugin-with-root=ok

# You might want to edit the following command, replacing <PLUGIN> with the name of your DNS provider, before you uncomment this line
# see https://eff-certbot.readthedocs.io/en/stable/using.html#dns-plugins
# ${SUDO} snap install certbot-dns-<PLUGIN>

# From now on, the following depends on your configuration and needs, so that the rest of the process should be done manually
# go to step 9 on https://certbot.eff.org/instructions?ws=nginx&os=debiantesting for more information.

## That's all, Folks !
