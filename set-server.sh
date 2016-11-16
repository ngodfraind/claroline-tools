#!/bin/bash

#specify a different home
#$HOME="path/to/home"

programs=( "vim" "git" "zsh" "wget" "curl" )
myzsh_default="gentoo"

#we need git & wget at the very least but it doesn't make sense if the others are not present
for name in ${programs[@]}; do
    command -v $name >/dev/null 2>&1 || { echo "I require $name but it's not installed. Aborting." >&2; exit 1; }
done

#installing oh-my-zsh
wget --no-check-certificate http://install.ohmyz.sh -O - | sh


#changing oh-my-zsh default
sed -i 's/ZSH_THEME="robbyrussell"/ZSH_THEME="'$myzsh_default'"/g' $HOME/.zshrc
