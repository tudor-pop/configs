
#!/bin/bash

/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

# install zsh
curl -fsSL https://fnm.vercel.app/install | bash
brew install starship
brew install wget
brew install exa
brew tap homebrew/cask-fonts
brew install font-fira-code

# change the default shell of the root user to zsh with the chsh command below.
curl -L git.io/antigen > ~/antigen.zsh
cp .zshrc ~

echo "alias ll=\"exa -abghHlS -L 1\"" >> ~/.profile

# Vim setup
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

cp .vimrc ~/

brew install neovim

vim +PlugInstall +qall > /dev/null

#reload terminal
source ~/.zshrc
source ~/.profile
