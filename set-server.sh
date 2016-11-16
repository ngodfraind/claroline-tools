#!/bin/bash

#specify a different home
#$HOME="path/to/home"

programs=( "vim" "git" "zsh" "wget" "curl" "php")
myzsh_default="gentoo"

#we need git & wget at the very least but it doesn't make sense if the others are not present
for name in ${programs[@]}; do
    command -v $name >/dev/null 2>&1 || { echo "I require $name but it's not installed. Aborting." >&2; exit 1; }
done

#installing oh-my-zsh
wget --no-check-certificate http://install.ohmyz.sh -O - | sh


#changing oh-my-zsh default
sed -i 's/ZSH_THEME="robbyrussell"/ZSH_THEME="'$myzsh_default'"/g' $HOME/.zshrc

#installing composer
php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');"
php -r "if (hash_file('SHA384', 'composer-setup.php') === 'aa96f26c2b67226a324c27919f1eb05f21c248b987e6195cad9690d5c1ff713d53020a02ac8c217dbf90a7eacc9d141d') { echo 'Installer verified'; } else { echo 'Installer corrupt'; unlink('composer-setup.php'); } echo PHP_EOL;"
php composer-setup.php
php -r "unlink('composer-setup.php');"


#installing nvm
curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.32.1/install.sh | bash

