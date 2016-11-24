#!/bin/sh

sudo apt-get update
sudo apt-get upgrade

# add necessary repositories
sudo add-apt-repository -y ppa:ondrej/php
sudo add-apt-repository -y ppa:ondrej/mysql-5.6
sudo apt-get update

sudo apt-get install guake php5.6-dev php5.6-mysql php5.6-cli php5.6-fpm php5.6-curl php5.6-zip php5.6-soap php5.6-intl php5.6-json php5.6-xml php5.6-mcrypt php5.6-mbstring mysql-server-5.6 sni-qt sni-qt:i386 git git-flow

#install software that is downloadable from the internet
wget https://repo.skype.com/latest/skypeforlinux-64-alpha.deb
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb

sudo dpkg -i skypeforlinux-64-alpha.deb
sudo dpkg -i google-chrome-stable_current_amd64.deb

sudo apt-get install -f

rm skypeforlinux-64-alpha.deb google-chrome-stable_current_amd64.deb


