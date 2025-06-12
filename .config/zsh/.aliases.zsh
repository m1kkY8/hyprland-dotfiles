alias sex='source $ZDOTDIR/.zshrc && exec zsh'
alias wgup="sudo wg-quick up wg0"
alias wgdown="sudo wg-quick down wg0"

# ---------------------------
# Single Letter QoL
# ---------------------------
alias c='clear'
alias t='touch'
alias n='nvim '
alias :q='exit'
alias s='sudo su -'

# ---------------------------
# Pentest
# ---------------------------
alias exegol="sudo -E $(which exegol)"
alias hosts='sudo vim /etc/hosts'

alias startkali='sudo virsh start kali'
alias stopkali='sudo virsh shutdown kali'

alias vpn='ifconfig tun0 | grep inet | awk "{print \$2}" | head -n 1 | wl-copy'
alias acadmey='sudo openvpn ~/docs/vpns/academy-regular.ovpn'
alias archprox="ssh -i ~/.ssh/pwn -D 9050 -q -C -N tox@pwn.local -f"
alias kaliprox="ssh -i ~/.ssh/hetzner -D 9050 -q -C -N milan@vps.ubuntu.hetzner -f"
alias startssh='sudo systemctl start sshd'
alias stopssh='sudo systemctl stop sshd'

# ---------------------------
# Configs
# ---------------------------
alias zshrc='nvim $ZDOTDIR/.zshrc'
alias aliases='nvim $ZDOTDIR/.aliases.zsh'
alias nvimrc='cd ~/.config/nvim && nvim'
alias hyprc="cd ~/.config/hypr/ && nvim"
alias monitors="nvim ~/.config/hypr/monitors.conf "
alias keyrc='nvim ~/dotfiles/keys.conf'
alias rekeyd='sudo cp ~/dotfiles/keys.conf /etc/keyd/AT\ Translated\ Set\ 2\ keyboard.conf && sudo systemctl restart keyd'
alias stop_kanata='systemctl --user stop kanata.service'
alias start_kanata='systemctl --user start kanata.service'
alias pdot='cd ~/dotfiles/ && bash push.sh'
alias reload-waybar='pkill waybar && hyprctl dispatch exec waybar'

alias marks="n ~/dotfiles/.local/share/bookmarks/marks"
# ---------------------------
# System commands
# ---------------------------
alias yay='yay --color=auto'
alias pacman='sudo pacman --color=auto'
alias reboot='sudo reboot now'

alias grep='grep --color=auto'
alias ip='ip --color'
alias myip='curl ifconfig.me'
alias svim='sudo nvim'
alias top='btop'
alias zed='zeditor'
alias thm='sudo openvpn ~/docs/vpns/SlobodaUsisivac.ovpn'
alias pwnc="ssh -i ~/.ssh/pwncollege hacker@pwn.college"

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
alias ll='exa --long --git --icons -snew --group-directories-first -lhgr'
alias la='exa --long --git --icons -snew --group-directories-first -lahgr'
alias gla='la | grep'
alias fzf='fzf --cycle'
alias cat='bat -pp '
alias sfile='grep --color=auto -Rnw . -e'
alias usage='du -ch | grep total'

# ---------------------------
# Dev 
# ---------------------------

alias pyserver='python3 -m http.server'
alias gpp='g++'
alias p='python3'
alias lzd='lazydocker'
alias lg='lazygit'
alias gor='go run'
alias gob='go build'

# ---------------------------
# Misc
# ---------------------------
kitty-reload() {
    kill -SIGUSR1 $(pidof kitty)
}

alias rec='asciinema rec'
alias nf='fastfetch'
alias leetcode='nvim leetcode.nvim'

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

# ---------------------------
# functions 
# ---------------------------

sendhax () {
  scp -i ~/.ssh/pwncollege "$1" hacker@pwn.college:/home/hacker/
}


sendkali() {
  local destination="pwn.kali.local:/home/kali/shared"
  
  if [[ -z "$1" ]]; then
    return 1
  fi

  for item in "$@"; do
    if [[ ! -e "$item" ]]; then
      echo -e "skipping $item"
      continue
    fi

    if [[ -d "$item" ]]; then
      scp -r "$item" "$destination"
    else 
      scp "$item" "$destination"
    fi
  done
}

sendarch() {
  
  if [[ -z "$1" ]]; then
    return 1
  fi

  for item in "$@"; do
    if [[ ! -e "$item" ]]; then
      echo -e "skipping $item"
      continue
    fi

    if [[ -d "$item" ]]; then
      scp -r "$item" pwn.local:/home/tox/shared
    else 
      scp  "$item" pwn.local:/home/tox/shared
    fi
  done
}

bandit(){
  sshpass -p $2 ssh $1@bandit.labs.overthewire.org -p 2220
}

