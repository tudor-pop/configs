# Word style: respect camelCase boundaries for Option+Backspace/Delete
WORDCHARS=''
autoload -U select-word-style
select-word-style bash
# Treat uppercase letters as word boundaries (subword/humpCase navigation)
zstyle ':zle:*' word-style unspecified
zstyle ':zle:*backward-kill-word' word-style subword
zstyle ':zle:*backward-word' word-style subword
zstyle ':zle:*forward-word' word-style subword
zstyle ':zle:*forward-kill-word' word-style subword
zstyle ':zle:*kill-word' word-style subword

# Up/Down arrow: prefix-based history search
autoload -U history-search-end
zle -N history-beginning-search-backward-end history-search-end
zle -N history-beginning-search-forward-end history-search-end
bindkey "^[[A" history-beginning-search-backward-end
bindkey "^[[B" history-beginning-search-forward-end

# History
HISTFILE=~/.zsh_history
HISTSIZE=50000
SAVEHIST=50000
setopt SHARE_HISTORY
setopt HIST_IGNORE_DUPS

# Navigation and correction
setopt AUTO_CD
setopt CORRECT

# Case-insensitive tab completion
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'

# Aliases
alias vim=nvim
alias tf=terraform
alias python=python3
alias ll="eza -abghHlS -L 1"
alias cat=bat
alias reload="source ~/.zshrc"

# PATH
export PATH="${PATH}:${HOME}/.krew/bin"

# Zsh plugins (brew-installed)
if command -v brew &>/dev/null; then
  BREW_PREFIX="$(brew --prefix)"
  [ -f "$BREW_PREFIX/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh" ] && source "$BREW_PREFIX/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"
  [ -f "$BREW_PREFIX/share/zsh-autosuggestions/zsh-autosuggestions.zsh" ] && source "$BREW_PREFIX/share/zsh-autosuggestions/zsh-autosuggestions.zsh"
  [ -d "$BREW_PREFIX/share/zsh-completions" ] && fpath=("$BREW_PREFIX/share/zsh-completions" $fpath)
fi

# Shell tools
command -v mcfly &>/dev/null && eval "$(mcfly init zsh)"
setopt HIST_IGNORE_SPACE
command -v starship &>/dev/null && eval "$(starship init zsh)"
command -v fnm &>/dev/null && eval "$(fnm env)"

# SDKMAN
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$SDKMAN_DIR/bin/sdkman-init.sh" ]] && source "$SDKMAN_DIR/bin/sdkman-init.sh"

# Google Cloud SDK
for gcloud_dir in /usr/local/bin/google-cloud-sdk "$HOME/google-cloud-sdk"; do
  [ -f "$gcloud_dir/path.zsh.inc" ] && source "$gcloud_dir/path.zsh.inc"
  [ -f "$gcloud_dir/completion.zsh.inc" ] && source "$gcloud_dir/completion.zsh.inc"
done

# iTerm2
test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

# Kubernetes
export KUBE_EDITOR="nvim"
if [ -d "$HOME/.kube" ]; then
  export KUBECONFIG=$KUBECONFIG:$(ls ~/.kube | grep -e .conf -e config | awk -v d="$HOME/.kube/" '{ printf "%s%s:", d,$0}')
fi
autoload -U +X compinit && compinit
if command -v kubectl &>/dev/null; then
  source <(kubectl completion zsh)
  alias k=kubectl
  compdef __start_kubectl k
fi
command -v kubens &>/dev/null && alias kns=kubens && compdef __start_kubens kns
command -v kubectx &>/dev/null && alias ktx=kubectx && compdef __start_kubectx ktx
autoload -U +X bashcompinit && bashcompinit
[ -x /opt/homebrew/bin/terraform ] && complete -o nospace -C /opt/homebrew/bin/terraform terraform
# bun completions
[ -s "$HOME/.bun/_bun" ] && source "$HOME/.bun/_bun"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"