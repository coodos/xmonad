set fish_greeting

################################# FISH BANG BANG #########################################

function __history_previous_command
  switch (commandline -t)
  case "!"
    commandline -t $history[1]; commandline -f repaint
  case "*"
    commandline -i !
  end
end

function __history_previous_command_arguments
  switch (commandline -t)
  case "!"
    commandline -t ""
    commandline -f history-token-search-backward
  case "*"
    commandline -i '$'
  end
end

bind ! __history_previous_command
bind '$' __history_previous_command_arguments

################################ END BANG BANG ###############################################

###################################### aliases ###############################################

alias vim="nvim"
alias modi3="nvim ~/.config/i3/config"
alias modpoly="nvim ~/.config/polybar/"
alias modxmo="nvim ~/.xmonad/xmonad.hs"
alias modvim="nvim ~/.config/nvim/init.vim"
alias cdpr="cd ~/Projects"
alias modfish="nvim ~/.config/fish/config.fish"
alias l="lsd -lah"
alias modpicom="nvim ~/.config/picom/picom.conf"
alias ls="lsd"
alias virsh="virsh --connect qemu:///system"
alias ..="cd .."
alias ...="cd ../../"
alias grep="grep --color=auto"
alias cp="cp -i"
alias df="df -h"
alias ssh="kitty +kitten ssh"
alias btw="neofetch"
alias BTW="neofetch | lolcat"
alias Btw="pfetch | lolcat"
alias c="clear"
alias gentoo-btw="neofetch --ascii_distro gentoo | sed 's/Arch Linux/Gentoo/' | sed 's/-arch1-/-gentoo1-/' | sed 's/pacman/emerge/' | sed 's/arch-btw/gentoo-btw/'"

# aliases for devour
alias vid="devour mpv"
alias pic="devour sxiv"
alias pdf="devour zathura"

# git aliases

alias gst="git status"
alias ga="git add ."
alias gpll="git pull"
alias gpsh="git push"
alias gc="git commit -am"
alias gb="git branch"
alias gckt="git checkout"
alias ginit="git init"
alias doomsync=".emacs.d/bin/doom sync"

##################################### end aliases ############################################


starship init fish | source

if status --is-login
    if test (tty) = /dev/tty1
        bash ~/start.sh
    end
end

export ANDROID_SDK=/home/merul/Android/Sdk/
set -gx PATH $ANDROID_HOME/emulator $PATH
fish_vi_key_bindings
