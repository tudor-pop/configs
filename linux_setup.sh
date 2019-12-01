#!/bin/bash

sudo apt-get update
sudo apt-get upgrade
# install zsh
sudo apt-get install zsh
# change the default shell of the root user to zsh with the chsh command below.
cp .zshrc ~
sudo apt install wget git -y
<<<<<<< HEAD
curl -L git.io/antigen > antigen.zsh
=======

curl -L git.io/antigen > ~/antigen.zsh
>>>>>>> 2a27e638cc5e03c751583a0155c74ef1da0c005d

### EXA
wget https://github.com/ogham/exa/releases/download/v0.9.0/exa-linux-x86_64-0.9.0.zip
sudo apt-get install unzip -y
unzip exa*.zip
sudo mv exa-linux-x86_64 /usr/local/bin/exa
rm exa-*.zip

sudo chsh -s "$(command -v zsh)" "${USER}"
echo $SHELL
#reload terminal
source ~/.zshrc
<<<<<<< HEAD

# docker
sed -i 's/plugins=(git)/plugins=(git zsh-autosuggestions docker docker-compose)/g' ~/.zshrc
exec zsh

=======
>>>>>>> 2a27e638cc5e03c751583a0155c74ef1da0c005d

echo "alias ll=\"exa -abghHlS -L 1\"" >> ~/.profile
source ~/.profile

#fzf
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install

# Vim setup
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

cp .vimrc ~/

vim +PlugInstall +qall > /dev/null
source ~/.profile
