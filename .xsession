#!/bin/sh

#
# ~/.xsession
#
# Executed by xdm/gdm/kdm at login

export TERM="kitty"
export TERM2="alacritty"
export TERM3="urxvt"
export FILE="ranger"
export EDITOR="vim"
export VISUAL="nvim"
export BROWSER="brave"
export PAGER="bat"
export SUDO_ASKPASS=$HOME/.scripts/dmenu-askpass
export OPENER="rifle"

# Source important files
[[ -f ~/.thismachineonlyrc ]] && . ~/.thismachineonlyrc
[[ -f ~/.dmenurc ]] && . ~/.dmenurc

# Update PATH
[[ -d ~/.config/i3/scripts ]] && export PATH=$HOME/.config/i3/scripts:$PATH
[[ -d ~/.scripts ]] && export PATH=$HOME/.scripts:$PATH
[[ -d ~/.bin ]] && export PATH=$HOME/.bin:$PATH
[[ -d ~/.local/bin ]] && export PATH=$HOME/.local/bin:$PATH
[[ -d ~/.cargo/bin ]] && export PATH=$HOME/.cargo/bin:$PATH
[[ -d ~/.go/bin ]] && export PATH=$HOME/.go/bin:$PATH
[[ -d ~/.fly ]] && export PATH=$HOME/.fly:$PATH
[[ -d ~/.detaspace/bin ]] && export PATH=$HOME/.detaspace/bin:$PATH
[[ -d ~/.local/share/nvim/site/pack/packer/start/vim-iced/bin ]] && export PATH=$HOME/.local/share/nvim/site/pack/packer/start/vim-iced/bin:$PATH
[[ -d ~/.nimble/bin ]] && export PATH=$HOME/.nimble/bin:$PATH

