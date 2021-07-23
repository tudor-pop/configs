#!/bin/bash

# sudo apt-get update
# sudo apt-get upgrade
# install zsh
sudo apt-get install zsh
sudo snap install starship
sudo apt install fonts-firacode
# change the default shell of the root user to zsh with the chsh command below.
curl -L git.io/antigen > ~/antigen.zsh
cp .zshrc ~
sudo apt install wget git -y


### EXA
wget https://github.com/ogham/exa/releases/download/v0.9.0/exa-linux-x86_64-0.9.0.zip
sudo apt-get install unzip -y
unzip exa*.zip
sudo mv exa-linux-x86_64 /usr/local/bin/exa
rm exa-*.zip

echo "alias ll=\"exa -abghHlS -L 1\"" >> ~/.profile


#fzf
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install -y

# Vim setup
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

cp .vimrc ~/
chown -R $USER:$USER $HOME/.vim/autoload
chown -R $USER:$USER $HOME/.vim
vim +PlugInstall +qall > /dev/null

sudo chsh -s "$(command -v zsh)" "${USER}"
echo $SHELL
#reload terminal
source ~/.zshrc

source ~/.profile
