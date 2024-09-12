### Added by Zinit's installer
if [[ ! -f $HOME/.local/share/zinit/zinit.git/zinit.zsh ]]; then
    print -P "%F{33} %F{220}Installing %F{33}ZDHARMA-CONTINUUM%F{220} Initiative Plugin Manager (%F{33}zdharma-continuum/zinit%F{220})…%f"
    command mkdir -p "$HOME/.local/share/zinit" && command chmod g-rwX "$HOME/.local/share/zinit"
    command git clone https://github.com/zdharma-continuum/zinit "$HOME/.local/share/zinit/zinit.git" && \
        print -P "%F{33} %F{34}Installation successful.%f%b" || \
        print -P "%F{160} The clone has failed.%f%b"
fi

source "$HOME/.local/share/zinit/zinit.git/zinit.zsh"
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit

# Load a few important annexes, without Turbo
# (this is currently required for annexes)
zinit light-mode for \
    zdharma-continuum/zinit-annex-as-monitor \
    zdharma-continuum/zinit-annex-bin-gem-node \
    zdharma-continuum/zinit-annex-patch-dl \
    zdharma-continuum/zinit-annex-rust

### End of Zinit's installer chunk
#
#
# Prompt
#bindkey -v
PS1='%F{blue}%~ %(?.%F{green}.%F{red})%#%f '

export PATH=$PATH:$(go env GOPATH)/bin
export PATH=$PATH:$HOME/.cargo/bin
setopt AUTO_CD

#eval "$(starship init zsh)"
eval "$(zoxide init zsh)"

autoload -U +X compinit && compinit

# Plugins
zinit ice depth=1
zinit light jeffreytse/zsh-vi-mode

# Vim mode

# Only changing the escape key to `jk` in insert mode, we still
# keep using the default keybindings `^[` in other modes

zinit light Aloxaf/fzf-tab
zinit light zdharma-continuum/fast-syntax-highlighting
zinit light zsh-users/zsh-autosuggestions

EDITOR="nvim"

HISTFILE="$HOME/.zsh_history"
HISTSIZE=10000
SAVEHIST=10000
setopt append_history
setopt SHARE_HISTORY

zstyle ':completion:*:description' format '[%d]'
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'eza -1 --color=always $realpath'
zstyle ':fzf-tab:complete:cd:*' popup-pad 30 0

source <(fzf --zsh)

source ~/.personal.zsh
source ~/.aliases.zsh


# pnpm
export PNPM_HOME="/home/tox/.local/share/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end
#
eval "$(starship init zsh)"
export PATH=$HOME/.local/bin:$PATH
