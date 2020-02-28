
#!/bin/bash

/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

# install zsh
brew install zsh
brew install starship
brew install wget
brew install exa
brew install fzf
brew install httpie

# To install useful key bindings and fuzzy completion:
$(brew --prefix)/opt/fzf/install

# change the default shell of the root user to zsh with the chsh command below.
curl -L git.io/antigen > ~/antigen.zsh
cp .zshrc ~

echo "alias ll=\"exa -abghHlS -L 1\"" >> ~/.profile

# Vim setup
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

cp .vimrc ~/

vim +PlugInstall +qall > /dev/null

sudo chsh -s "$(command -v zsh)" "${USER}"
echo $SHELL
#reload terminal
source ~/.zshrc
source ~/.profile
