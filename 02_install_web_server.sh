#!/bin/bash
# widely inspired (and mostly copied) from :
# https://packages.sury.org/php/README.txt
# 'cause when it comes to IT, the lazier the better !
#
if [ "$(whoami)" != "root" ]; then
    SUDO=sudo
fi

${SUDO} apt-get -y install apt-transport-https lsb-release ca-certificates curl
${SUDO} wget -O /etc/apt/trusted.gpg.d/php.gpg https://packages.sury.org/php/apt.gpg
${SUDO} sh -c 'echo "deb https://packages.sury.org/php/ $(lsb_release -sc) main" > /etc/apt/sources.list.d/php.list'
${SUDO} apt-get update

## NGINX + MARIADB
${SUDO} apt-get install -y nginx mariadb-server

## PHP 8.3 : EOL 23 nov 2026
${SUDO} apt-get install -y php8.3-cli php8.3-common php8.3-{apcu,bz2,curl,gd,imagick,imap,intl,ldap,mbstring,mysql,opcache,readline,soap,xml,xmlrpc,zip}    
${SUDO} apt-get install -y php8.3-fpm

## PHP 8.2 : EOL 8 Dec 2025
${SUDO} apt-get install -y php8.2-cli php8.2-common php8.2-{apcu,bz2,curl,gd,imagick,imap,intl,ldap,mbstring,mysql,opcache,readline,soap,xml,xmlrpc,zip}    
${SUDO} apt-get install -y php8.2-fpm

## you can add other php versions, if needed :

## PHP 8.1 : EOL 25 Nov 2024
# ${SUDO} apt-get install -y php8.1-cli php8.1-common php8.1-{apcu,bz2,curl,gd,imagick,imap,intl,ldap,mbstring,mysql,opcache,readline,soap,xml,xmlrpc,zip}    
# ${SUDO} apt-get install -y php8.1-fpm



## SECURING MYSQL
# as we installed mariadb-server we assume you'll want to secure it a bit
${SUDO} mysql_secure_installation

## Installing adminer (https://adminer.org)
# Or maybe not ! As adminer seems to have been discontinued for 2 years now.
# AdminerEvo is a fork which started as of July 2023 but let's be honnest, I'd rather use a local BDD client from now on
# (like DBeaver for example). I'm just leaving those lines here to avoid regression. I'll let you choose & uncomment 
# which one you really want if ever you want one
#
# cd /var/www/html/
# ${SUDO} wget https://github.com/vrana/adminer/releases/download/v4.8.1/adminer-4.8.1.php -O admnr.php
# or
# ${SUDO} wget https://github.com/adminerevo/adminerevo/releases/download/v4.8.2/adminer-4.8.2.php -O admnr.php

# then, to configure all that shit, just go to
# https://www.geek17.com/fr/content/debian-11-bullseye-installer-et-configurer-la-derniere-version-de-php-8-fpm-avec-nginx-121
# and follow instructions


## CERTBOT LET'S ENCRYPT
# As we're installing a web server, we also presume that you'll want HTTPS
# comment the following lines if you don't
# source : https://certbot.eff.org/instructions?ws=nginx&os=debiantesting
${SUDO} apt-get install -y snapd
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
