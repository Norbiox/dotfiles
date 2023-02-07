#
# ~/.bash_profile
#

#export TERM="urxvt"
export TERM="alacritty"
export FILE="ranger"
export EDITOR="nvim"
export VISUAL="nvim"
export BROWSER="brave"

# if running bash
if [ -n "$BASH_VERSION" ]; then
    # include .bashrc if it exists
    if [ -f "$HOME/.bashrc" ]; then
	. "$HOME/.bashrc"
    fi
fi

if [ -d "$HOME/bin" ] ; then
    PATH="$HOME/bin:$PATH"
fi

if [ -d "$HOME/.local/bin" ] ; then
    PATH="$HOME/.local/bin:$PATH"
fi

if [ -d "$HOME/.cargo/bin" ] ; then
    PATH="$HOME/.cargo/bin:$PATH"
fi

if [ -d "$HOME/.go/bin" ] ; then
    PATH="$HOME/.go/bin:$PATH"
fi

if [ -d "$HOME/.scripts" ] ; then 
    PATH="$HOME/.scripts:$PATH"
fi

if [ -d "$HOME/.fly" ] ; then 
    PATH="$HOME/.fly:$PATH"
fi

if [ -d "$HOME/.local/share/nvim/site/pack/packer/start/vim-iced/bin" ] ; then
    PATH="$HOME/.local/share/nvim/site/pack/packer/start/vim-iced/bin:$PATH"
fi

#---Add my scripts to PATH---#
if [ -d "$HOME/.scripts" ] ; then
    PATH="$HOME/.scripts:$PATH"
fi
