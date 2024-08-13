#!/bin/bash
# easy dist-upgrade Debian 11 to Debian 12
# scripted from https://www.it-connect.fr/tuto-mise-a-niveau-debian-11-vers-debian-12-bookworm/
#

if [ "$(whoami)" != "root" ]; then
    SUDO=sudo
fi

# first, we upgrade the existing
${SUDO} apt-get update && ${SUDO} apt-get full-upgrade -y

# backup original source.list
cp /etc/apt/sources.list /etc/apt/sources.list.bak

# If using Zabbix monitoring, we first need to delete one file that is no more usefull 
# and can cause 404 errors during the next update. 
directory="/etc/apt/sources.list.d"
files=("zabbix-agent2-plugins.list") 

for file in "${files[@]}"; do
    if [ -f "$directory/$file" ]; then
        echo "$file is being isolated"
        ${SUDO} rm -f $file
    else
        echo "no $file found. Resuming ..."
    fi
done

# modify *.list with the new version's odename
${SUDO} sed -i 's/bullseye/bookworm/g' /etc/apt/sources.list
${SUDO} sed -i 's/bullseye/bookworm/g' /etc/apt/sources.list.d/*.list

# spec. Debian 12 : adding the new non-free-firmware if non-free is already set
${SUDO} sed -i 's/non-free/non-free non-free-firmware/g' /etc/apt/sources.list
${SUDO} sed -i 's/non-free/non-free non-free-firmware/g' /etc/apt/sources.list.d/*.list

# switch to new distribution
# keeping every modified by config file as is (new one suffixed .dpkg-dist if needed later)
# see https://raphaelhertzog.com/2010/09/21/debian-conffile-configuration-file-managed-by-dpkg/#:~:text=Avoiding%20the%20conffile%20prompt
${SUDO} apt-get update
DEBIAN_FRONTEND=noninteractive ${SUDO} -E apt-get -o Dpkg::Options::="--force-confdef" -o Dpkg::Options::="--force-confold" dist-upgrade -y

# We're good for a reboot
${SUDO} reboot

# once the system has reboot, you should be 
# executing https://github.com/Loiseau2nuit/system-update-and-cleanup-bash-script/blob/main/system_cleanup.sh
