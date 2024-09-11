alias c='clear'
alias t='touch'
alias n='TERM=xterm-kitty nvim '
alias :q='exit'
alias s='sudo su -'
alias lg='lazygit'
alias ff='firefox'

alias svim='sudo nvim'
alias top='btop'
alias fzf='fzf --cycle'

alias zshrc='nvim ~/.zshrc'

# git aliases
alias gc='git clone'
alias gst='git status'
alias gpm="git push -u origin main"
alias commit="meteor"


alias sex='source ~/.zshrc && exec zsh'

alias pacman='sudo pacman --color=auto'
alias yay='yay --color=auto'

alias l='exa -1 --icons -snew --group-directories-first'
alias ls='exa --icons -snew --group-directories-first'
alias ll='exa --long --git --icons -snew --group-directories-first -lhr'
alias la='exa --long --git --icons -snew --group-directories-first -lahr'
alias gla='la | grep'
alias cat='bat -pp --theme="Catppuccin Mocha"'
alias nf='fastfetch'

alias sfile='grep --color=auto -Rnw . -e'
alias sshstart='sudo systemctl start sshd'

alias cpv='rsync -avh --info=progress2'
alias tks='tmux kill-server'


alias gpp='g++'
alias p='python3'
alias pyserver='python3 -m http.server'

alias usage='du -ch | grep total'

# yt-dlp
alias dlsong='yt-dlp --no-write-description --no-playlist --extract-audio --add-metadata --audio-format mp3'
alias dlalbum='yt-dlp --no-write-description --yes-playlist --extract-audio --add-metadata -q --progress --audio-format mp3'
alias yt-best='yt-dlp -f bestaudio+bestvideo'

alias cdd='cd $(fd -H . "$HOME" --type d | fzf --info=inline-right --reverse --preview "tree -C {}")'
