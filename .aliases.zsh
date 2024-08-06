alias :q='exit'

alias hyprc="nvim ~/.config/hypr/"
alias x='xplr'
alias fucking='sudo'
alias n='nvim'
alias n.='nvim .'
alias top='btop'
alias svim='sudo nvim'
alias lg='lazygit'
alias fzf='fzf --cycle'
alias zshconf='nvim ~/.zshrc'
alias sex='source ~/.zshrc && exec zsh'

alias pacman='sudo pacman --color=auto'
alias yay='yay --color=auto'

alias s='sudo su -'
alias shutdown='shutdown now'

alias c='clear'
alias ls='exa --icons -snew --group-directories-first'
alias ll='exa --long --git --icons -snew --group-directories-first -lhr'
alias la='exa --long --git --icons -snew --group-directories-first -lahr'
alias gla='la | grep'
alias cat='bat -pp'
alias nf='fastfetch'

alias pacs='sudo pacman -S'
alias pacsyu='sudo pacman -Syu'
alias pacrns='sudo pacman -Rns'
alias search='sudo pacman -Ss | grep'
alias sfile='grep -Rnw . -e'
alias sshstart='sudo systemctl start sshd'

alias cpv='rsync -avh --info=progress2'
alias tks='tmux kill-server'

alias gc="git clone"
alias gpm="git push -u origin main"

alias gpp='g++'
alias p='python3'
alias pyserver='python3 -m http.server'

alias usage='du -ch | grep total'

# yt-dlp

alias dlsong='yt-dlp --no-write-description --no-playlist --extract-audio --add-metadata --audio-format mp3'
alias dlalbum='yt-dlp --no-write-description --yes-playlist --extract-audio --add-metadata -q --progress --audio-format mp3'
alias yt-best='yt-dlp -f bestaudio+bestvideo'

alias cdd='cd $(fd -H . "$HOME" --type d | fzf --info=inline-right --reverse --preview "tree -C {}")'
alias rmm='find | fzf --reverse --multi --cycle --info=inline-right | xargs -I {} rm -rf {}'

function vimf(){
    selected=$(fd -H --type f --type l --exclude=Pictures --exclude=Music \
        | fzf --cycle --info=inline-right --reverse --preview \
        "bat -pp --color=always {}" --preview-window=right,65%)

    if [[ -z $selected ]]; then
        return 0;
    else
        nvim $selected
    fi
}
