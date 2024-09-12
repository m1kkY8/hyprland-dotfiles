# -----------------
# Env vars
# -----------------
export PATH=$PATH:$(go env GOPATH)/bin
export PATH=$PATH:$HOME/.cargo/bin
export PATH=$HOME/.local/bin:$PATH

export PNPM_HOME="/home/tox/.local/share/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac

EDITOR="nvim"

# -----------------
# History
# -----------------
HISTFILE="$HOME/.zsh_history"
HISTSIZE=10000
SAVEHIST=10000
setopt SHARE_HISTORY
setopt APPEND_HISTORY
setopt INC_APPEND_HISTORY
setopt HIST_EXPIRE_DUPS_FIRST 
setopt HIST_IGNORE_DUPS
setopt HIST_FIND_NO_DUPS
setopt HIST_REDUCE_BLANKS

# -----------------
# Opts
# -----------------
setopt AUTO_CD
setopt NO_CASE_GLOB

# -----------------
# Zoxide
# -----------------
eval "$(zoxide init zsh)"

# -----------------
# Zinit Plugin manager
# -----------------
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


autoload -U +X compinit && compinit

# -----------------
# Zinit plugins
# -----------------

zinit ice depth=1
zinit light Aloxaf/fzf-tab
zinit light zdharma-continuum/fast-syntax-highlighting
zinit light zsh-users/zsh-autosuggestions

# -----------------
# FZF
# -----------------
source <(fzf --zsh)

zstyle ':completion:*:git-checkout:*' sort false
zstyle ':completion:*:descriptions' format '[%d]'
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' menu no
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'eza -1 --color=always $realpath'
zstyle ':fzf-tab:*' switch-group '<' '>'

# -----------------
# Personal stuff (recommended to remove)
# -----------------

if [[ -f "$HOME/.aliases.zsh" ]]; then
  source "$HOME/.aliases.zsh"
fi

if [[ -f "$HOME/.personal.zsh" ]]; then
  source "$HOME/.personal.zsh"
fi

# -----------------
# Propmt
# -----------------
eval "$(starship init zsh)"
