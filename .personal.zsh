#zsh
alias personals='nvim ~/.personal.zsh'
alias aliases='nvim ~/.aliases.zsh'
alias reb='sudo reboot now'
alias updatelinks='stow . --adopt'

#vim
alias nvimrc='cd ~/.config/nvim && nvim'
alias purgevim='rm -rf ~/.config/nvim ~/.local/share/nvim'

alias sorter='python3 ~/projects/py-sorter/sorter.py'

#bot
alias adolfus='node ~/projects/bot/bot.js &'

#tastatura
alias swapcaps='setxkbmap -option "ctrl:swapcaps"'
alias swapesc='setxkbmap -option "caps:swapescape"'
alias restorekbd='setxkbmap -option'
alias xmod='xmodmap ~/.Xmodmap'

#masine
alias mint='sudo virsh start mint'

alias smint='ssh mile@mint'

alias dlmusic="~/projects/yt-scrapper/downloader.sh"

alias vencord="~/projects/bash-scripts/vencord"
alias pdf='zathura'
alias kys='sudo shutdown now'
alias ip='ip --color'
alias myip='curl ifconfig.me'
alias initproject="git init && npm init -y && echo 'node_modules\npackage-lock.json' > .gitignore"

alias navit="navi --tldr"
alias rec="asciinema rec"
