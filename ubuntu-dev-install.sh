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
Install_bash_git_prompt () {
    #git clone https://github.com/magicmonty/bash-git-prompt.git $HOME/.bash-git-prompt --depth=1
    cat configurations/bash_git_prompt/bashrc >> $HOME/.bashrc
}
# Install_phpstorm () {
#     #todo
# }

Install_composer () {
    php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');"
    sudo php composer-setup.php --install-dir=/usr/bin --filename=composer
    php -r "unlink('composer-setup.php');"

    cat configurations/composer/composer_path >> $HOME/.profile
}

sudo apt-get update
sudo apt-get upgrade -y

# add necessary repositories
sudo add-apt-repository -y ppa:ondrej/php
sudo add-apt-repository -y ppa:ondrej/mysql-5.6
sudo apt-add-repository -y ppa:jtaylor/keepass
sudo apt-get update

sudo apt-get install -y keepass2 guake php5.6-dev php5.6-mysql php5.6-cli php5.6-fpm php5.6-curl php5.6-zip php5.6-soap php5.6-intl php5.6-json php5.6-xml php5.6-mcrypt php5.6-mbstring php-pear mysql-server-5.6 sni-qt sni-qt:i386 git git-flow xdotool

#install software that is downloadable from the internet
wget https://repo.skype.com/latest/skypeforlinux-64-alpha.deb
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
wget "https://www.dropbox.com/download?dl=packages/ubuntu/dropbox_2015.10.28_amd64.deb" -O dropbox.deb

sudo dpkg -i skypeforlinux-64-alpha.deb
sudo dpkg -i google-chrome-stable_current_amd64.deb
sudo dpkg -i dropbox.deb

sudo apt-get install -f -y

rm skypeforlinux-64-alpha.deb google-chrome-stable_current_amd64.deb dropbox.deb

if [ ! -d $HOME/.config/autostart ]; then
    mkdir -p $HOME/.config/autostart
fi
cp ./configurations/autostart $HOME/.config/autostart

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
        a ) Install_apache; break;;
        n ) Install_nginx; break;;
    esac
done

while true; do
read -p "Do you wish to install composer? [y,n]" yn
    case $yn in
        y ) Install_composer; break;;
        n ) break;;
    esac
done

while true; do
read -p "Do you wish to install bash-git-prompt? [y,n]" yn
    case $yn in
        y ) Install_bash_git_prompt; break;;
        n ) break;;
    esac
done
