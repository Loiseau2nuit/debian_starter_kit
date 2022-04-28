# debian_starter_kit
Set your VPS up in minutes

## What's this ?

Some usefull scripts to run after installing a debian VPS.

It basically brings in a few scripts the tools you need to run any VPS server running on latest Debian release (Debian 11 Bullseye to this day)

Those scripts do not configure anything (yet). They just install the needed packages, and YOU should check their documentations in order to get them to suit your needs.

## Instructions

### Runing Order

01_install_starter.sh should be the first script you execute.

It sets up your whole debian environment.

Then, when everything is set up, you could execute following scripts in any order you want (well, basically today there are only one of them ;-D)

### How To execute

1. 'git clone' this repo to your ${USER} directory.
2. you might want to customize the scripts before executing them
3. then, execute the foollowing command for each script

$ sudo chmod +x <name_of_the_script> && sudo ./<name_of_the_script>

4. Once the scripts are executed, please refer to each package documentation to configure them to your needs.
