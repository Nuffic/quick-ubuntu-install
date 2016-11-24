#!/bin/sh
Install_apache () {
    sudo apt-get install -y libapache2-mod-php5.6
    sudo cp ./configurations/php/30-development.ini /etc/php/5.6/apache2/conf.d/
}

Install_nginx () {
    sudo apt-get install -y nginx 
    sudo cp ./configurations/php/30-development.ini /etc/php/5.6/fpm/conf.d/
}

Install_st3 () {
    wget https://download.sublimetext.com/sublime-text_build-3126_amd64.deb
    sudo dpkg -i sublime-text_build-3126_amd64.deb
    rm sublime-text_build-3126_amd64.deb
}
Install_phpstorm () {
    #todo
}

sudo apt-get update
sudo apt-get upgrade

# add necessary repositories
sudo add-apt-repository -y ppa:ondrej/php
sudo add-apt-repository -y ppa:ondrej/mysql-5.6
sudo apt-get update

sudo apt-get install -y guake php5.6-dev php5.6-mysql php5.6-cli php5.6-fpm php5.6-curl php5.6-zip php5.6-soap php5.6-intl php5.6-json php5.6-xml php5.6-mcrypt php5.6-mbstring php-pear mysql-server-5.6 sni-qt sni-qt:i386 git git-flow

#install software that is downloadable from the internet
wget https://repo.skype.com/latest/skypeforlinux-64-alpha.deb
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb

sudo dpkg -i skypeforlinux-64-alpha.deb
sudo dpkg -i google-chrome-stable_current_amd64.deb

sudo apt-get install -f

cp ./configurations/autostart $HOME/.config/autostart

rm skypeforlinux-64-alpha.deb google-chrome-stable_current_amd64.deb

while true; do
    read -p "Do you wish to install Sublime text 3? [y,n]" yn
    case $yn in
        y ) Install_st3; break;;
        n ) break;;
    esac
done

while true; do
read -p "Do you wish to install apache or nginx? [a,n]" apachenginx
    case $apachenginx in
        n ) Install_apache; break;;
        a ) Install_nginx; break;;
    esac
done