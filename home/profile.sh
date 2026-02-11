#!/usr/bin/env bash

# Environment variables
export PNPM_HOME="$HOME/Library/pnpm"
export PATH=$PATH:/usr/local/bin:~/bin:~/.bin:/opt/homebrew/bin:/usr/local/go/bin/:~/.cargo/bin:$PNPM_HOME:~/.local/bin:~/go/bin

export PYTHONSTARTUP=~/.pythonrc

if command -v nvim >/dev/null 2>&1; then
    alias vim=nvim
    export EDITOR=nvim
else
    export EDITOR=vim
fi

alias ll='ls -lah'

export SCREENDIR=~/.screen
export HISTFILE=~/.histfile
export HISTSIZE=1000
export SAVEHIST=1000
export VIRTUAL_ENV_DISABLE_PROMPT=true

# worktrunk (wt) shell integration
# https://github.com/max-sixty/worktrunk
if command -v wt >/dev/null 2>&1; then
    eval "$(command wt config shell init zsh)"
fi
