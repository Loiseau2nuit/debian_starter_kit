# debian_starter_kit
Complete your Debian server up in minutes!

## What's this ?

Some usefull scripts to run after installing a debian dedicated server, VM or VPS.

It implies that the OS is already installed and the machine is up & running (which is mostly the case when you work on an infrastructure with deployment facilities). If not, you'll have to set your server up before executing those.

It basically brings, through a few scripts, the additional tools you might need to run on any Debian server such as : common dependencies, improved CLIs or utilities tools, or whatever you like to have on basically any server that is not installed by default. Mainly designed for operating web servers, this is essentialy what me, myself and I 'd like to have on a server after the OS is up, but feel free to personalize them scripts before you use them.

Those scripts do not configure anything (yet). They just install the needed packages, and YOU should check their documentations in order to get them to suit your needs.

## Instructions

It's quite simple, just execute scripts, following their numbers, and your needs !

### 01_install_starter.sh 

should be the first script you execute.

It sets whole debian environment up.

In that case, it mainly brings :
- ZSH instead of bash, with OhMyZSH additional tools for it's simplicity and aesthetics purposes (see https://ohmyz.sh/)
- A personalized shell (with neofetch and some OhMyZsh plugins)
- some tools to improve UX : exa (https://the.exa.website/) instead of ls; htop (https://htop.dev/) instead of top, ...
- some usefull network tools & CLIs that are not shipped by default with debian (whois, rsync, nettools, ...)

Then, when everything is set up, you could execute following scripts in any order you want (well, basically today there are only one of them ;-D)

### How To execute

1. 'git clone' this repo to your ${USER} directory.
2. you might want to customize the scripts before executing them
3. then, execute the foollowing command for each script

$ sudo chmod +x <name_of_the_script> && sudo ./<name_of_the_script>

4. Once the scripts are executed, please refer to each package documentation to configure them to your needs.
