# debian_starter_kit
Complete your Debian server up in minutes!

## What's this ?

Some usefull scripts to run after installing a debian dedicated server, VM or VPS.

It implies that the OS is already installed and the machine is up & running (which is mostly the case when you work on an infrastructure with deployment facilities). If not, you'll have to set your server up before executing those.

It basically brings, through a few scripts, the additional tools you might need to run on any Debian server such as : common dependencies, improved CLIs or utilities tools, or whatever you like to have on basically any server that is not installed by default. This is mainly what me, myself and I 'd like to have on a server after the OS is up, but feel free to personalize it before you run it.

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
