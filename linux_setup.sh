#!/bin/bash

sudo apt-get update
sudo apt-get upgrade
# install zsh
sudo apt-get install zsh
# change the default shell of the root user to zsh with the chsh command below.

sudo apt install wget git
wget https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh -O - | zsh

sudo chsh -s "$(command -v zsh)" "${USER}"
echo $SHELL
# install spaceship prompt
git clone https://github.com/denysdovhan/spaceship-prompt.git "$ZSH_CUSTOM/themes/spaceship-prompt"
ln -s "$ZSH_CUSTOM/themes/spaceship-prompt/spaceship.zsh-theme" "$ZSH_CUSTOM/themes/spaceship.zsh-theme"

# change theme in .zshrc
sudo sed -i 's/robbyrussell/spaceship/g' ~/.zshrc

#reload terminal
. ~/.zshrc

# add autosuggestions
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
# docker
sed -i 's/plugins=(git)/plugins=(git zsh-autosuggestions docker docker-compose)/g' ~/.zshrc
exec zsh

wget https://github.com/ogham/exa/releases/download/v0.8.0/exa-linux-x86_64-0.8.0.zip
unzip exa-linux-x86_64-0.8.0.zip
sudo mv exa-linux-x86_64 /usr/bin/exa
rm ./*.zip

echo "alias ll=\"exa -abghHlS -L 1\"" >> ~/.profile
. ~/.profile

# Vim setup
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

git clone https://github.com/PopTudor/configs
cp ./configs/.vimrc ./.vimrc

vim +PlugInstall +qall > /dev/null
source ~/.profile
