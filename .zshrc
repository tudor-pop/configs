# Aliases
alias vim=nvim
alias tf=terraform
alias python=python3
alias ll="eza -abghHlS -L 1"
alias reload="source ~/.zshrc"

# PATH
export PATH="${PATH}:${HOME}/.krew/bin"

# Zsh plugins (brew-installed)
source $(brew --prefix)/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source $(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh
fpath=($(brew --prefix)/share/zsh-completions $fpath)

# Shell tools
eval "$(mcfly init zsh)"
setopt HIST_IGNORE_SPACE
eval "$(starship init zsh)"
eval "$(fnm env)"

# SDKMAN
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"

# Google Cloud SDK
if [ -f '/usr/local/bin/google-cloud-sdk/path.zsh.inc' ]; then . '/usr/local/bin/google-cloud-sdk/path.zsh.inc'; fi
if [ -f '/usr/local/bin/google-cloud-sdk/completion.zsh.inc' ]; then . '/usr/local/bin/google-cloud-sdk/completion.zsh.inc'; fi

# iTerm2
test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

# Kubernetes
export KUBECONFIG=$KUBECONFIG:$(ls ~/.kube | grep -e .conf -e config | awk -v d="$HOME/.kube/" '{ printf "%s%s:", d,$0}')
autoload -U +X compinit && compinit
source <(kubectl completion zsh)
alias k=kubectl
compdef __start_kubectl k
alias kns=kubens
compdef __start_kubens kns
alias ktx=kubectx
compdef __start_kubectx ktx
autoload -U +X bashcompinit && bashcompinit
complete -o nospace -C /opt/homebrew/bin/terraform terraform