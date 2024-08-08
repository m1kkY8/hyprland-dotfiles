#zsh
alias updatelinks='stow . --adopt'
alias personals='nvim ~/.personal.zsh'
alias aliases='nvim ~/.aliases.zsh'

alias reb='sudo reboot now'
alias kys='sudo shutdown now'
#vim
alias nvimrc='cd ~/.config/nvim && nvim'
alias hyprc="cd ~/.config/hypr/ && nvim"
alias purgevim='rm -rf ~/.config/nvim ~/.local/share/nvim'
#bot
alias adolfus='node ~/projects/bot/bot.js &'

alias dlmusic="~/projects/yt-scrapper/downloader.sh"

alias vencord="~/projects/bash-scripts/vencord"
alias pdf='zathura'

alias ip='ip --color'
alias myip='curl ifconfig.me'

alias rec="asciinema rec"

alias initproject="git init && npm init -y && echo 'node_modules\npackage-lock.json' > .gitignore"
