#!/bin/sh

echo -e "\e[1;37m[\e[1;33m+\e[1;37m] \e[0;0m Setting hostname"
hostnamectl set-hostname lapt0p

echo -e "\e[1;37m[\e[1;33m+\e[1;37m] \e[0;0m Upgrading distro"
apt upgrade -y > /dev/null
apt update > /dev/null

echo -e "\e[1;37m[\e[1;33m+\e[1;37m] \e[0;0m Installing apts"
apt install -y arc-theme vim openvpn git net-tools radare2 openjdk-8-jre htop pip3-python > /dev/null
apt add-apt-repository ppa:openjdk-r/ppa > /dev/null
apt update > /dev/null
apt install -y openjdk-11-jdk openjdk-11-jre-headless > /dev/null

echo -e "\e[1;37m[\e[1;33m+\e[1;37m] \e[0;0m Download dotfiles"
git clone --quiet https://github.com/docfile0/dotfiles.git ~/.dotfiles > dev/null

echo -e "\e[1;37m[\e[1;33m+\e[1;37m] \e[0;0m Deploying fonts"
unzip ~/.dotfiles/fonts/hack-font.zip
cp ~/.dotfiles/fonts/ttf/* ~/usr/share/fonts/ 
fc-cache -f -v 

echo -e "\e[1;37m[\e[1;33m+\e[1;37m] \e[0;0m Enabling UFW"
ufw enable

echo -e "\e[1;37m[\e[1;33m+\e[1;37m] \e[0;0m Tweaking Gnome"
apt remove gnome-shell-extensions-ubuntu-dock -y > /dev/null

echo -e "\e[1;37m[\e[1;33m+\e[1;37m] \e[0;0m Deploying dot files such as vimrc"
cp ~/.dotfiles/vimrc ~/.vimrc
cp ~/.dotfiles/bashrc ~/.bashrc

echo -e "\e[1;37m[\e[1;33m+\e[1;37m] \e[0;0m Deploying wallpaper"
cp ~/.dotfiles/wallpapers/791016.png /usr/share/backgrounds/
gsettings set org.gnome.desktop.background picture-uri 'file:///usr/share/backgrounds/791016.png'

echo -e "\e[1;37m[\e[1;33m+\e[1;37m] \e[0;0m Deploying terminal dconf"
dconf load /org/gnome/terminal/legacy/profiles:/:1430663d-083b-4737-a7f5-8378cc8226d1/ < terminal.dconf

echo -e "\e[1;37m[\e[1;33m+\e[1;37m] \e[0;0m Deleting dot files"
rm -rf ~/.dotfiles

echo -e "\e[1;37m[\e[1;33m+\e[1;37m] \e[0;0m Complete"
