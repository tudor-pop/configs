#!/bin/bash

sudo apt-get update
sudo apt-get upgrade
# install zsh
sudo apt-get install zsh
# change the default shell of the root user to zsh with the chsh command below.
cp .zshrc ~
sudo apt install wget git -y
# OH-MY-ZSH
sh -y -c "$(wget https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"

### EXA
wget https://github.com/ogham/exa/releases/download/v0.9.0/exa-linux-x86_64-0.9.0.zip
sudo apt-get install unzip -y
unzip exa*.zip
sudo mv exa-linux-x86_64 /usr/local/bin/exa
rm exa-*.zip

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


echo "alias ll=\"exa -abghHlS -L 1\"" >> ~/.profile
source ~/.profile

# Vim setup
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

cp .vimrc ~/

vim +PlugInstall +qall > /dev/null
source ~/.profile
