#!/bin/sh

export TERMINAL_CMD=kitty
export TERMINAL_CMD2=alacritty
export FILE=ranger
export EDITOR=nvim
export VISUAL=nvim
export BROWSER=brave
export PAGER=bat
export OPENER=rifle
export QT_QPA_PLATFORMTHEME=qt5ct
export QT_STYLE_OVERRIDE=kvantum
export _JAVA_OPTIONS='-Dawt.useSystemAAFontSettings=on'

# Source important files
[[ -f ~/.thismachineonlyrc ]] && . ~/.thismachineonlyrc
[[ -f ~/.dmenurc ]] && . ~/.dmenurc

# Add custom paths
[[ -d ~/.config/i3/scripts ]] && export PATH=$HOME/.config/i3/scripts:$PATH
[[ -d ~/.config/sway/scripts ]] && export PATH=$HOME/.config/i3/scripts:$PATH
[[ -d ~/.scripts ]] && export PATH=$HOME/.scripts:$PATH
[[ -d ~/.bin ]] && export PATH=$HOME/.bin:$PATH
[[ -d ~/.local/bin ]] && export PATH=$HOME/.local/bin:$PATH
[[ -d ~/.cargo/bin ]] && export PATH=$HOME/.cargo/bin:$PATH
[[ -d ~/.go/bin ]] && export PATH=$HOME/.go/bin:$PATH
[[ -d ~/.fly ]] && export PATH=$HOME/.fly:$PATH
[[ -d ~/.detaspace/bin ]] && export PATH=$HOME/.detaspace/bin:$PATH
[[ -d ~/.local/share/nvim/site/pack/packer/start/vim-iced/bin ]] && export PATH=$HOME/.local/share/nvim/site/pack/packer/start/vim-iced/bin:$PATH
[[ -d ~/.nimble/bin ]] && export PATH=$HOME/.nimble/bin:$PATH  # Nim packages
[[ -d ~/.pub-cache/bin ]] && export PATH=$HOME/.pub-cache/bin:$PATH  # Dart packages

# Android development
export ANDROID_HOME=$HOME/Android/Sdk
[[ -d $ANDROID_HOME ]] && export PATH=$PATH:$ANDROID_HOME/emulator
[[ -d $ANDROID_HOME ]] && export PATH=$PATH:$ANDROID_HOME/tools
[[ -d $ANDROID_HOME ]] && export PATH=$PATH:$ANDROID_HOME/tools/bin
[[ -d $ANDROID_HOME ]] && export PATH=$PATH:$ANDROID_HOME/platform-tools

# Flutter development
export FLUTTER_HOME=$HOME/Dev/flutter
export PATH="$PATH:$FLUTTER_HOME/bin:$FLUTTER_HOME/cache/dart-sdk/bin:$HOME/.pub-cache/bin"
export CHROME_EXECUTABLE=/usr/bin/brave


export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm

# Source $HOME/.bashrc in interactive shells
if [ -n "$BASH_VERSION" -a -n "$PS1" ]; then
  if [ -f "$HOME/.bashrc" ]; then
    . "$HOME/.bashrc"
  fi
fi
