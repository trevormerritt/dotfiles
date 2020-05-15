#!/bin/bash

function installYarn() {
    sudo curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add - 
    sudo echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list
    sudo apt update && apt install yarn
}

# Install APT packages
function aptPackages() {
    sudo "apt-get update && apt-get install tmux ssh less htop iotop a2ps"
}

# Moving in Git config.
function doGit() {
    touch ~/.gitconfig && mv ~/.gitconfig ./old/gitconfig
    ln -s $PWD/gitconfig ~/.gitconfig

    echo "[include]" >>~/.gitconfig
    echo "path = $PWD/old/gitconfig" >>~/.gitconfig
}

# Move In tmux
function doTmux() {
    touch ~/.tmux.conf && mv ~/.tmux.conf ./old/tmux.conf
    ln -s $PWD/tmux.conf ~/.tmux.conf

}

aptPackages
doGit
installYarn

