#!/bin/bash
# some usefull packages when it comes to dealing with a debien server
#
if [ "$(whoami)" != "root" ]; then
    SUDO=sudo
fi

# some might already be installed, depending on your distribution
${SUDO} apt-get -y install apticron cowsay curl dnsutils exa fortunes git glpi-agent htop neofetch netcat-openbsd net-tools python3-pygments rsync screen sudo tmux whois zsh

# set ZSH up as your default shell
${SUDO} chsh -s $(which zsh)

# Install OhMyZsh and follow steps (you'll thank me later !)
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# add some new lines to ~/.zshrc (this part actually needs to be tested)
echo " " >> ~/.zshrc
echo " \# some new adds of mine " >> ~/.zshrc
echo " alias ls='ls -ailsh --color' " >> ~/.zshrc
echo " alias lx='exa -lRTL=2' " >> ~/.zshrc
echo " alias top='htop' " >> ~/.zshrc
echo " alias rm='rm -i' " >> ~/.zshrc
echo " alias mv='mv -i' " >> ~/.zshrc
echo " alias cp='cp -i' " >> ~/.zshrc
echo "  " >> ~/.zshrc
echo " cd ~ " >> ~/.zshrc
echo " clear " >> ~/.zshrc
echo " neofetch " >> ~/.zshrc
echo " echo \"=========================================================\" " >> ~/.zshrc
echo " echo \"Checking for upgrades ...\" " >> ~/.zshrc
echo " apt list --upgradable " >> ~/.zshrc
echo " echo \"run 'sudo apt update && sudo apt full-upgrade -y' if any.\" " >> ~/.zshrc
echo " echo \"=========================================================\" " >> ~/.zshrc
echo "  " >> ~/.zshrc
echo " chuck_cow " >> ~/.zshrc
echo " echo \"=========================================================\" " >> ~/.zshrc
