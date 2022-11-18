
#!/bin/bash

/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> /Users/tudor/.zprofile
eval "$(/opt/homebrew/bin/brew shellenv)"

# install zsh
curl -fsSL https://fnm.vercel.app/install | bash
brew install starship
brew install wget
brew install exa

brew tap homebrew/cask-fonts
brew install font-fira-code
brew install iproute2mac 

brew install kubectl
brew install kubectx
brew install derailed/k9s/k9s
brew tap blendle/blendle
brew install kns
brew install helm

brew install awscli

brew install tfenv
tfenv install latest
tfenv use latest
brew install tfsec

brew install --cask 1password/tap/1password-cli

brew install isacikgoz/taps/tldr
brew tap cantino/mcfly && brew install mcfly
# change the default shell of the root user to zsh with the chsh command below.
curl -L git.io/antigen > ~/antigen.zsh
cp .zshrc ~

echo "alias ll=\"exa -abghHlS -L 1\"" >> ~/.profile

# Vim setup
# sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
#       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

brew install neovim

cp .vimrc ~/
vim +PlugInstall +qall > /dev/null

#reload terminal
source ~/.zshrc
source ~/.profile
