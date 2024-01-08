#!/bin/bash

export LANG=en_US.UTF-8
export VISUAL=nvim
export EDITOR=$VISUAL

export PATH=$PATH:/usr/local/bin
export PATH=$PATH:/opt/homebrew/bin
export PATH=$PATH:~/Library/Python/3.9/lib/python/site-packages
export PATH=$PATH:/usr/local/go/bin

source $(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh

### utility

PROMPT="%# "

alias rmc="rm -i"
alias cpc="cp -i"
alias mvc="mv -i"

alias ls="ls --color=always"
alias ll="ls -l --color=always"

alias less="less -R"
alias diff="diff --color"
alias grep="grep --color"
alias egrep="egrep --color"
alias fgrep="fgrep --color"

### scripts

script_paths=(
  "$HOME/scripts/shell-mommy.sh"   # terminal mommy  
  "$HOME/scripts/xkcd.sh"          # xkcd cli
  "$HOME/scripts/lfcd.sh"          # lf cd extension
)

for script_path in "${script_paths[@]}"; do
  if [ -f "$script_path" ]; then
    source "$script_path"
  else
    echo "[Error] script $script_path not found"
  fi
done

### kitty config

# https://sw.kovidgoyal.net/kitty/kittens/icat/
alias icat="kitten icat"

# https://sw.kovidgoyal.net/kitty/kittens/diff/
alias kdiff="kitten diff"

### oh-my-posh

if [ "$TERM_PROGRAM" != "Apple_Terminal" ]; then
  # themes: https://ohmyposh.dev/docs/themes
  eval "$(oh-my-posh init zsh --config $(brew --prefix oh-my-posh)/themes/emodipt-extend.omp.json)"
fi

### it speaks!

alias aoeu="echo I see you are a man of culture"
alias hello="echo Hello World!"
alias hi="echo Hi!"
alias moo="cowsay moo"

### terminal mommy 😳

DEFAULT_PROMPT_COMMAND=""
PROMPT_COMMAND=""

precmd() { eval "$PROMPT_COMMAND" }

function mommy_enable() {
  if [[ $1 == "true" ]]; then
    export PROMPT_COMMAND="mommy :; $PROMPT_COMMAND"
  elif [[ $1 == "false" ]]; then
    export PROMPT_COMMAND=$DEFAULT_PROMPT_COMMAND
  else
    echo Invalid Argument!
  fi
}
