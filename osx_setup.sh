#!/bin/bash

# Install Homebrew if not already installed
if ! command -v brew &>/dev/null; then
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> "$HOME/.zprofile"
fi
eval "$(/opt/homebrew/bin/brew shellenv)"

# Shell tools
brew install starship
brew install wget
brew install eza
brew install jq
brew install yq
brew install ripgrep
brew install bat
brew install gh
brew install fnm

brew install git
git config --global core.editor "nvim"

brew install --cask font-fira-code
brew install iproute2mac

# Kubernetes
brew install kubectl
brew install kubectx
brew install derailed/k9s/k9s
brew install helm
brew install argocd

# AWS
brew install awscli

# Terraform
brew install tfenv
eval "$(/opt/homebrew/bin/brew shellenv)"
tfenv install latest
tfenv use latest
brew install trivy

brew install --cask 1password/tap/1password-cli

brew install tldr
brew tap cantino/mcfly && brew install mcfly

# Zsh plugins (installed directly, no plugin manager needed)
brew install zsh-syntax-highlighting
brew install zsh-completions
brew install zsh-autosuggestions
brew install fzf
cp .zshrc ~

# Vim setup
brew install neovim

# Install vim-plug for both vim and neovim
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

cp .vimrc ~/
mkdir -p ~/.config/nvim
ln -sf ~/.vimrc ~/.config/nvim/init.vim
vim +PlugInstall +qall > /dev/null

# SDKMAN (Java/Maven version manager)
curl -s "https://get.sdkman.io" | bash

echo "Setup complete. Restart your terminal to apply changes."