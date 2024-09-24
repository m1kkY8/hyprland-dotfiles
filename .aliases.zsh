alias sex='source ~/.zshrc && exec zsh'

# ---------------------------
# Single Letter QoL
# ---------------------------
alias c='clear'
alias t='touch'
alias n='nvim '
alias :q='exit'
alias s='sudo su -'
alias lg='lazygit'
alias ff='firefox'

# ---------------------------
# Configs
# ---------------------------
alias zshrc='nvim ~/.zshrc'
alias aliases='nvim ~/.aliases.zsh'
alias nvimrc='cd ~/.config/nvim && nvim'
alias hyprc="cd ~/.config/hypr/ && nvim"
alias keyrc='nvim ~/dotfiles/keys.conf'
alias rekeyd='sudo cp ~/dotfiles/keys.conf /etc/keyd/AT\ Translated\ Set\ 2\ keyboard.conf && sudo systemctl restart keyd'
alias pdot='~/dotfiles/push.sh'

# ---------------------------
# System commands
# ---------------------------
alias yay='yay --color=auto'
alias pacman='sudo pacman --color=auto'

alias grep='grep --color=auto'
alias ip='ip --color'
alias myip='curl ifconfig.me'
alias svim='sudo nvim'
alias top='btop'

# ---------------------------
# Git 
# ---------------------------
alias initproject="git init && npm init -y && echo 'node_modules\npackage-lock.json' > .gitignore"
alias gc='git clone'
alias gst='git status'
alias gpm="git push -u origin main"
alias commit="meteor"

# ---------------------------
# Files
# ---------------------------
alias ls='exa -1 --icons -snew --group-directories-first'
alias ll='exa --long --git --icons -snew --group-directories-first -lhr'
alias la='exa --long --git --icons -snew --group-directories-first -lahr'
alias gla='la | grep'
alias fzf='fzf --cycle'
alias cat='bat -pp '
alias sfile='grep --color=auto -Rnw . -e'
alias usage='du -ch | grep total'

# ---------------------------
# Misc
# ---------------------------
alias combat='cd "/home/tox/projects/CombatExtended/ModPatches/RH2 Faction - Militaires Sans Frontieres"'
alias pyserver='python3 -m http.server'
alias gpp='g++'
alias p='python3'
kitty-reload() {
    kill -SIGUSR1 $(pidof kitty)
}

alias rec='asciinema rec'

# ---------------------------
# Tmux
# ---------------------------
alias tks='tmux kill-server'
alias cleares="rm ~/.local/share/tmux/resurrect -rf" 
alias lsres="ls ~/.local/share/tmux/resurrect" 

# ---------------------------
# yt-dlp
# ---------------------------
alias dlsong='yt-dlp --no-write-description --no-playlist --extract-audio --add-metadata --audio-format mp3'
alias dlalbum='yt-dlp --no-write-description --yes-playlist --extract-audio --add-metadata -q --progress --audio-format mp3'
alias yt-best='yt-dlp -f bestaudio+bestvideo'
