#!/bin/bash

# sudo apt-get update
# sudo apt-get upgrade
# install zsh
sudo apt-get install zsh
sudo sh -c "$(curl -fsSL https://starship.rs/install.sh)"
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
chown -R $USER:$USER $HOME/.vim/autoload/
vim +PlugInstall +qall > /dev/null

sudo chsh -s "$(command -v zsh)" "${USER}"
echo $SHELL
#reload terminal
source ~/.zshrc

source ~/.profile

# docker
sudo apt-get install \
    apt-transport-https \
    ca-certificates \
    curl \
    gnupg \
    lsb-release
    
 curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
 
 echo \
  "deb [arch=amd64 signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu \
  $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
  
  sudo apt-get update
   sudo apt-get install docker-ce docker-ce-cli containerd.io
sudo usermod -aG docker $USER
# configure docker to start on reboot
sudo systemctl enable docker.service
sudo systemctl enable containerd.service
# compose
sudo curl -L "https://github.com/docker/compose/releases/download/1.29.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose
sudo ln -s /usr/local/bin/docker-compose /usr/bin/docker-compose



